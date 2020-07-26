Class shvarov.LoadFile
{

ClassMethod Run()
{
  set fn="/irisdev/app/files/war-and-peace.txt"
    d ..Load(fn)
}

ClassMethod Load(fn As %String)
{
    set stream = ##Class(%Stream.FileCharacter).%New()
    set stream.LineTerminator = $Char(13,10)
    $$$TOE(sc,stream.LinkToFile(fn))
    while 'stream.AtEnd {
        set line=stream.ReadLine()
        if '$Length($translate(line," ","")) Continue
        set ^Book($I(^Book))=line
        }
    write "The book contains "_^Book_" lines"
}

}
