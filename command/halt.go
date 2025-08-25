package command

import (
  "fmt"
)

type HaltCmd struct {
  SubCmd
}

func newHaltCmd(name string) (*HaltCmd, error) {
  sc, err := newSubCmd(name)
  instance := &HaltCmd{
    *sc,
  }

  // Add additional flagset arguments here
  
  return instance, err
}

func (c *HaltCmd) run(args []string) {
  c.SubCmd.run(args)
  fmt.Println(c.Name)
}
