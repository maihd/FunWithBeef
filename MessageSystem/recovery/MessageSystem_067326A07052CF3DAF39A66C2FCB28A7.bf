namespace MessageSystem;

using System;
using System.Collections;

public class MessageSystem
{
    delegate void Listener(Message message);

    readonly Dictionary<int, Listener>    mListenersByType;
    readonly Dictionary<int, Listener> mListenersByName;

    public this()
    {
        mListenersByType = new Dictionary<int, Listener>();
        mListenersByName = new Dictionary<int, Listener>();
    }

    public ~this()
    {
        delete mListenersByType;
        delete mListenersByName;
    }

    public void Post(Message message)
    {
        if (mListenersByType.GetValue(message.type) case .Ok(let listenerOnType))
        {
            listenerOnType(message);
        }

        if (mListenersByName.GetValue(message.name.GetHashCode)) case .Ok(let listenerOnName))
        {
            listenerOnName(message);
        }
    }

    public void ListenOnType(int type, Listener listener)
    {
        mListenersByType.Add(type, listener);
    }

    public void ListenOnName(StringView name, Listener listener)
    {
        mListenersByName.Add(name.GetHashCode(), listener);
    }
}