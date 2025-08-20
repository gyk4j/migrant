package command

import (
  "fmt"
  "flag"
  "os"
)

var haltCmd *flag.FlagSet

func init() {
  haltCmd = flag.NewFlagSet("halt", flag.ExitOnError)
}

func Halt() {
  fmt.Println("halt")
  haltCmd.Parse(os.Args[2:])
}