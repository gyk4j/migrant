package command

type Runnable interface {
	run(args []string)
	getName() string
}

func Run(r Runnable, args []string) {
	r.run(args)
}
