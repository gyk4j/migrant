package command

import (
  "fmt"
  "flag"
  "os"
)

var upCmd *flag.FlagSet

func init() {
  upCmd = flag.NewFlagSet("up", flag.ExitOnError)
}

func Up() {
  fmt.Println("up")
  upCmd.Parse(os.Args[2:])
}