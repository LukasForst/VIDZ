Class Exercise3.Section2 [ Abstract, Not ProcedureBlock ]
{

ClassMethod Task1()
{
}

ClassMethod Task2()
{
        Set f1 = 0, f2 = 1, max = 100
        For fib = f1:0:max
        {
                Write fib," " 
                Set f1 = f2, f2 = fib
                Set fib = f1 + f2 
        }
        #; 0 1 1 2 3 5 8 13 21 34 55 89
}

ClassMethod Task3()
{
        Set f1 = 0, f2 = 1, max = 100
        Set fib = f1
        While (fib '> max) 
        {
                Write fib," " 
                Set f1 = f2, f2 = fib
                Set fib = f1 + f2
        }
        #; 0 1 1 2 3 5 8 13 21 34 55 89
}

ClassMethod Task4()
{
        Set f1 = 0, f2 = 1, max = 100
        Set fib = f1

        Do {
                Write fib," " 
                Set f1 = f2, f2 = fib
                Set fib = f1 + f2
        } While (fib '> max)
        #; 0 1 1 2 3 5 8 13 21 34 55 89
}

}
