package command

import (
  "fmt"
  "flag"
  "os"
)

var reloadCmd *flag.FlagSet

func init() {
  reloadCmd = flag.NewFlagSet("reload", flag.ExitOnError)
}

func Reload() {
  fmt.Println("reload")
  reloadCmd.Parse(os.Args[2:])
}