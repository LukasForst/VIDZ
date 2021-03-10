Class Exercise3.Section2 [ Abstract, Not ProcedureBlock ]
{

ClassMethod Task1()
{
}

ClassMethod Task2()
{
        Set x = 2 + 3 * 5
        #; 25
}

ClassMethod Task3()
{
        Set y = 2 + (3 * 5)
        #; 17
}

ClassMethod Task4()
{
        Write x = y
        #; 0
}

ClassMethod Task5()
{
        Write x > y
        #; 1
}

ClassMethod Task6()
{
        Write "apple" + 1
        #; 1
}

ClassMethod Task7()
{
        Write "2string" + 1
        #; 3
}

ClassMethod Task8()
{
        Write "string2" + 1
        #; 1
}

ClassMethod Task9()
{
        Set areaCode = 617
        Set phone = areaCode_"-555-1234"
        Write phone
        #; 617-555-1234
}

ClassMethod Task10()
{
        Write phone?3N1"-"3N1"-"4N
        #; 1
}


ClassMethod Task11()
{
        Write $PIECE(phone, "-", 2)
        #; 555
}

ClassMethod Task12()
{
        Set x = 1
        Set y = 2
        If (x = y)
        { 
                Write "X is equal to Y"
        } 
        ElseIf (x < y) 
        { 
                Write "Y is greater then X" 
        }
        Else 
        {
                Write "X is greater then Y" 
        }
        #; output depends on the X and Y, but in this case:
        #; Y is greater then X
        
}

ClassMethod Task13()
{
        Kill
}


}
