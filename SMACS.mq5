#import "SMACS.dll"

#property indicator_chart_window

#property indicator_buffers 1
#property indicator_plots 1

#property indicator_label1 "SMA"
#property indicator_type1 DRAW_LINE
#property indicator_color1 clrRed
#property indicator_style1 STYLE_SOLID
#property indicator_width1 1

input int PERIOD = 12;

double sma[];

int OnInit()
{
    SetIndexBuffer(0, sma, INDICATOR_DATA);

    PlotIndexSetString(0, PLOT_LABEL, "SMA(" + IntegerToString(PERIOD) + ")");

    return INIT_SUCCEEDED;
}

int OnCalculate(const int TOTAL,
        const int PREV,
        const datetime &T[],
        const double &O[],
        const double &H[],
        const double &L[],
        const double &C[],
        const long &TVOL[],
        const long &VOL[],
        const int &SP[])
{
    double c[];

    ArrayCopy(c, C);

    SMACS::sma(sma, c, PERIOD, TOTAL, PREV);

    return TOTAL;
}
