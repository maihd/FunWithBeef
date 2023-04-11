namespace Enum;

using System;
using System.Collections;

enum JsonValue
{
	case Null;
	case Number(double);
	case Boolean(bool);
	case String(String);
	case Array(List<JsonValue> array);
	case Object(Dictionary<String, JsonValue>);

	public void ToString(String buffer)
	{
		switch (this)
		{
		case Null:
			buffer += "null";
			break;

		case Number(let x):
			buffer += x;
			break;

		case Boolean(let x):
			buffer += x ? "true" : "false";
			break;

		case String(let x):
			buffer += "\"";
			buffer += x;
			buffer += "\"";
			break;

		case Array(let x):
			buffer += "[";

			int index = 0;
			for (let value in x)
			{
				value.ToString(buffer);

				index++;
				if (index < x.Count)
				{
					buffer += ",";
				}
			}

			buffer += "]";
			break;

		case Object(let x):
			buffer += "{";

			int index = 0;
			for (let (key, value) in x)
			{
				buffer += "\"";
				key.ToString(buffer);
				buffer += "\"";
				buffer += ":";
				value.ToString(buffer);

				index++;
				if (index < x.Count)
				{
					buffer += ",";
				}
			}

			buffer += "}";
			break;
		}
	}
}