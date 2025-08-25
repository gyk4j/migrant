package command

import (
  "fmt"
)

type StatusCmd struct {
  SubCmd
}

func newStatusCmd(name string) (*StatusCmd, error) {
  sc, err := newSubCmd(name)
  instance := &StatusCmd{
    *sc,
  }

  // Add additional flagset arguments here
  
  return instance, err
}

func (c *StatusCmd) run(args []string) {
  c.SubCmd.run(args)
  fmt.Println(c.Name)
}
