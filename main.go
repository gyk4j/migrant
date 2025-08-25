package main

import (
  "path/filepath"
  "flag"
  "fmt"
  "os"
  // "github.com/gyk4j/migrant/model"
  "github.com/gyk4j/migrant/command"
)

func main() {
  
  if len(os.Args) < 2 {
    fmt.Println("Usage: ", filepath.Base(os.Args[0]), "{help|status|global-status|version|init|up|ssh|reload|provision|halt|destroy}")
    os.Exit(1)
  }

  flag.Parse()

  commands := make(map[string]command.Runnable)
  var cmd command.Runnable

  cmd, _ = command.NewHelpCmd("help")
  commands["help"] = cmd

  cmd, _ = command.NewStatusCmd("status")
  commands["status"] = cmd

  cmd, _ = command.NewGlobalStatusCmd("global-status")
  commands["global-status"] = cmd

  cmd, _ = command.NewVersionCmd("version")
  commands["version"] = cmd

  cmd, _ = command.NewInitCmd("init")
  commands["init"] = cmd

  cmd, _ = command.NewUpCmd("up")
  commands["up"] = cmd

  cmd, _ = command.NewSshCmd("ssh")
  commands["ssh"] = cmd

  cmd, _ = command.NewReloadCmd("reload")
  commands["reload"] = cmd

  cmd, _ = command.NewProvisionCmd("provision")
  commands["provision"] = cmd

  cmd, _ = command.NewHaltCmd("halt")
  commands["halt"] = cmd

  cmd, _ = command.NewDestroyCmd("destroy")
  commands["destroy"] = cmd

  cmd = commands[os.Args[1]]
  
  if cmd != nil {
    cmd.Run(os.Args[2:])
  } else {
    fmt.Println("Usage: ", filepath.Base(os.Args[0]), "{help|status|global-status|version|init|up|ssh|reload|provision|halt|destroy}")
    os.Exit(1)
  }
}
