package main

import (
	"fmt"
	"os"
	"os/exec"
	"sync"
)

func run_node(cmd_str string, node int, origin int, wg *sync.WaitGroup) {
	cmd := exec.Command("sh", "-c", cmd_str)
        cmd.Stderr = os.Stderr
        cmd.Stdout = os.Stdout
	cmd.Env = append(os.Environ(), fmt.Sprintf("NODE=ccqserv%d", node))
	cmd.Env = append(cmd.Env, fmt.Sprintf("ORIGIN=ccqserv%d", origin))
	fmt.Printf("command is: %s\n", cmd_str)
	err := cmd.Run()
	if err != nil {
		panic(err)
	}
	wg.Done()
}

func main() {
	const nb_node = 25 
	const first_node = 100
	const first_node_new = 125 
	wg := new(sync.WaitGroup)

	cmd_str_list := []string{
		`ssh -K ${ORIGIN} "sudo -u qserv sh -c 'chmod -R o+rx /qserv/data'"`,
		`ssh -K ${NODE} "sudo -u qserv sh -c 'mkdir -p /qserv/data && chmod -R o+w /qserv/data || echo \"Unable to chown /qserv/data\"'"`,
		`ssh -K ${NODE} "rsync -e 'ssh -K' --delete -r ${USER}@${ORIGIN}.in2p3.fr:/qserv/data /qserv/"`,
		`ssh -K ${NODE} "sudo sh -c 'chown qserv:qserv /qserv/data'"`,
		`ssh -K ${NODE} "sudo -u qserv sh -c 'chmod -R o-w /qserv'"`,
	}

	for j := 0; j < len(cmd_str_list); j++ {
		wg.Add(nb_node)
		for i := first_node_new; i < first_node_new+nb_node; i++ {
			go run_node(cmd_str_list[j], i, i-nb_node, wg)
		}
		wg.Wait()
	}
}
