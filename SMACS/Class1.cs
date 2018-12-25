using System;
using System.Collections.Generic;
using System.Linq;

using MoreLinq;
// PM> Install-Package morelinq -Version 3.1.0

public static class SMACS
{
    public static void sma(double[] sma, double[] c, int period, int total, int prev)
    {
        if (prev == 0 || total <= period)
        {
            c.WindowRight(period)
                    .Select(xs => xs.Average())
                    .ToArray()
                    .CopyTo(sma, 0);
        }
        else
        {
            Array.Copy(c.WindowRight(period)
                    .Skip(prev - 1)
                    .Select(xs => xs.Average())
                    .ToArray(), 0, sma, prev - 1, total - prev + 1);
            // Array.Copy(sourceArray, sourceIndex, destinationArray, destinationIndex, length);
        }
    }
}
