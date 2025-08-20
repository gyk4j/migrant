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

  switch os.Args[1] {
  case "help":
    command.Help()
  case "status":
    command.Status()
  case "global-status":
    command.GlobalStatus()
  case "version":
    command.Version()
  case "init":
    command.Init()
  case "up":
    command.Up()
  case "ssh":
    command.Ssh()
  case "reload":
    command.Reload()
  case "provision":
    command.Provision()
  case "halt":
    command.Halt()
  case "destroy":
    command.Destroy()
  // case "":
  //   Cmd.Parse(os.Args[2:])
  default:
    fmt.Println("Usage: ", filepath.Base(os.Args[0]), "{help|status|global-status|version|init|up|ssh|reload|provision|halt|destroy}")
    os.Exit(1)
  }
}
