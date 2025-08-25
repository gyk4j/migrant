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

  cf, err := command.NewCmdFactory()
  status, err := cf.Run(os.Args[1], os.Args[2:])

  fmt.Println(status)
  
  if err != nil {
    fmt.Println(err.Error())
    os.Exit(1)
  }

}
