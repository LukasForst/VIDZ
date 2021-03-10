Class Exercise3.Section1 [ Abstract, Not ProcedureBlock ]
{

ClassMethod Task1()
{
        Set x = 3
        Write x
        #; 3
}

ClassMethod Task2()
{
        Set (a, b, c) = "foo"
        Write
        #; a="foo"
        #; b="foo"
        #; c="foo"
}

ClassMethod Task3()
{
        Set x = "foo", y = "bar", z = "baz"
        Write
        #; a="foo"
        #; b="foo"
        #; c="foo"
        #; x="foo"
        #; y="bar"
        #; z="baz"

}

ClassMethod Task4()
{
        Set version = ##class(%SYSTEM.Version).GetVersion()
        Write version
        #; IRIS for UNIX (Ubuntu Server LTS for x86-64 Containers) 2018.1.1 (Build 643U) Thu May 31 2018 10:03:07 EDT
}

ClassMethod Task5()
{
        Read #!!,"Please enter your name: ",name,!,"Thank you!"
        Write name
        #; Lukas
}

ClassMethod Task6()
{
        Do ^%CD
        #; Namespace: %SYS
        #; You're in namespace %SYS
        #; Default directory is /usr/irissys/mgr/

        #; Namespace: USER 
        #; You're in namespace USER
        #; Default directory is /usr/irissys/mgr/user/

}

ClassMethod Task7()
{
        Kill version
        Write
        #; a="foo"
        #; b="foo"
        #; c="foo"
        #; name="Lukas"
        #; x="foo"
        #; y="bar"
        #; z="baz"
}

ClassMethod Task8()
{
        Kill a,b,c
        Write
        #; name="Lukas"
        #; x="foo"
        #; y="bar"
        #; z="baz"
}

ClassMethod Task9()
{
        Kill (x)
        Write
        #; x="foo"
}

ClassMethod Task10()
{
        Kill
        Write
        #; 
}

}
