namespace MessageSystem;

using System;

public class Message
{
    public int    type;
    public String name;

    public this()
    {
        type = 0;
        name = new String();
    }

    public ~this()
    {
        delete name;
    }

    public this(int type)
    {
        this.type = type;
        this.name = new String();
    }
    
    public this(StringView name)
    {
        this.type = 0;
        this.name = new String();
        name.ToString(this.name);
    }

    public this(int type, StringView name)
    {
        this.type = type;
        this.name = new String();
        name.ToString(this.name);
    }
}