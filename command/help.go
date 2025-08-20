package command

import (
  "fmt"
  "flag"
  "os"
)

var helpCmd *flag.FlagSet

func init() {
  helpCmd = flag.NewFlagSet("help", flag.ExitOnError)
}

func Help() {
  fmt.Println("help")
  helpCmd.Parse(os.Args[2:])
}