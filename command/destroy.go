package command

import (
  "fmt"
)

type DestroyCmd struct {
  SubCmd
}

func newDestroyCmd(name string) (*DestroyCmd, error) {
  sc, err := newSubCmd(name)
  instance := &DestroyCmd{
    *sc,
  }

  // Add additional flagset arguments here
  
  return instance, err
}

func (c *DestroyCmd) run(args []string) {
  c.SubCmd.run(args)
  fmt.Println(c.Name)
}

