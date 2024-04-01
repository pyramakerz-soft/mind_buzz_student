import 'package:flutter/material.dart';
import 'package:mind_buzz_refactor/core/app_color.dart';


//Copy this CustomPainter code to the Bottom of the File
class LockLessonItemPainter extends CustomPainter {
@override
void paint(Canvas canvas, Size size) {

Path path_0 = Path();
path_0.moveTo(size.width*0.7953445,size.height*0.9215686);
path_0.lineTo(size.width*0.01028278,size.height*0.9215686);
path_0.lineTo(size.width*0.01028278,0);
path_0.lineTo(size.width*0.9368380,0);
path_0.cubicTo(size.width*0.9459229,size.height*0.000004000216,size.width*0.9548535,size.height*0.005705569,size.width*0.9627686,size.height*0.01655510);
path_0.cubicTo(size.width*0.9706838,size.height*0.02740471,size.width*0.9773188,size.height*0.04303667,size.width*0.9820334,size.height*0.06194471);
path_0.cubicTo(size.width*0.9867481,size.height*0.08085284,size.width*0.9893856,size.height*0.1024000,size.width*0.9896889,size.height*0.1245088);
path_0.cubicTo(size.width*0.9899897,size.height*0.1466186,size.width*0.9879512,size.height*0.1685451,size.width*0.9837635,size.height*0.1881765);
path_0.lineTo(size.width*0.8421388,size.height*0.8521392);
path_0.cubicTo(size.width*0.8376812,size.height*0.8730039,size.width*0.8309640,size.height*0.8905020,size.width*0.8227147,size.height*0.9027392);
path_0.cubicTo(size.width*0.8144679,size.height*0.9149775,size.width*0.8050026,size.height*0.9214882,size.width*0.7953445,size.height*0.9215686);
path_0.close();

Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
paint_0_fill.color = Color(0xff3B5FAE).withOpacity(1.0);
canvas.drawPath(path_0,paint_0_fill);

Paint paint_1_fill = Paint()..style=PaintingStyle.fill;
paint_1_fill.color = Colors.white.withOpacity(1.0);
canvas.drawCircle(Offset(size.width*0.8611825,size.height*0.2843137),size.width*0.05912596,paint_1_fill);

Path path_2 = Path();
path_2.moveTo(size.width*0.8889049,size.height*0.2163569);
path_2.lineTo(size.width*0.8367763,size.height*0.2163569);
path_2.cubicTo(size.width*0.8362674,size.height*0.2163569,size.width*0.8357635,size.height*0.2167382,size.width*0.8352956,size.height*0.2174804);
path_2.cubicTo(size.width*0.8348252,size.height*0.2182225,size.width*0.8343985,size.height*0.2193098,size.width*0.8340386,size.height*0.2206804);
path_2.cubicTo(size.width*0.8336787,size.height*0.2220520,size.width*0.8333933,size.height*0.2236794,size.width*0.8332005,size.height*0.2254706);
path_2.cubicTo(size.width*0.8330051,size.height*0.2272618,size.width*0.8329049,size.height*0.2291814,size.width*0.8329049,size.height*0.2311206);
path_2.lineTo(size.width*0.8329049,size.height*0.3840167);
path_2.cubicTo(size.width*0.8329049,size.height*0.3859559,size.width*0.8330051,size.height*0.3878755,size.width*0.8332005,size.height*0.3896667);
path_2.cubicTo(size.width*0.8333933,size.height*0.3914578,size.width*0.8336787,size.height*0.3930853,size.width*0.8340386,size.height*0.3944559);
path_2.cubicTo(size.width*0.8343985,size.height*0.3958275,size.width*0.8348252,size.height*0.3969147,size.width*0.8352956,size.height*0.3976559);
path_2.cubicTo(size.width*0.8357635,size.height*0.3983980,size.width*0.8362674,size.height*0.3987804,size.width*0.8367763,size.height*0.3987804);
path_2.lineTo(size.width*0.8889049,size.height*0.3987804);
path_2.cubicTo(size.width*0.8899306,size.height*0.3987804,size.width*0.8909177,size.height*0.3972245,size.width*0.8916427,size.height*0.3944559);
path_2.cubicTo(size.width*0.8923676,size.height*0.3916873,size.width*0.8927763,size.height*0.3879324,size.width*0.8927763,size.height*0.3840167);
path_2.lineTo(size.width*0.8927763,size.height*0.2311206);
path_2.cubicTo(size.width*0.8927763,size.height*0.2272049,size.width*0.8923676,size.height*0.2234490,size.width*0.8916427,size.height*0.2206804);
path_2.cubicTo(size.width*0.8909177,size.height*0.2179118,size.width*0.8899306,size.height*0.2163569,size.width*0.8889049,size.height*0.2163569);
path_2.close();
path_2.moveTo(size.width*0.8688072,size.height*0.3518598);
path_2.lineTo(size.width*0.8568740,size.height*0.3518598);
path_2.lineTo(size.width*0.8589949,size.height*0.3073657);
path_2.cubicTo(size.width*0.8580463,size.height*0.3048941,size.width*0.8572699,size.height*0.3015755,size.width*0.8567352,size.height*0.2976980);
path_2.cubicTo(size.width*0.8561979,size.height*0.2938206,size.width*0.8559177,size.height*0.2895029,size.width*0.8559203,size.height*0.2851196);
path_2.cubicTo(size.width*0.8559203,size.height*0.2780922,size.width*0.8566530,size.height*0.2713539,size.width*0.8579537,size.height*0.2663853);
path_2.cubicTo(size.width*0.8592571,size.height*0.2614167,size.width*0.8610257,size.height*0.2586255,size.width*0.8628663,size.height*0.2586255);
path_2.cubicTo(size.width*0.8647095,size.height*0.2586255,size.width*0.8664756,size.height*0.2614167,size.width*0.8677789,size.height*0.2663853);
path_2.cubicTo(size.width*0.8690823,size.height*0.2713539,size.width*0.8698149,size.height*0.2780922,size.width*0.8698149,size.height*0.2851196);
path_2.cubicTo(size.width*0.8698098,size.height*0.2895422,size.width*0.8695141,size.height*0.2938912,size.width*0.8689589,size.height*0.2977745);
path_2.cubicTo(size.width*0.8684036,size.height*0.3016578,size.width*0.8676041,size.height*0.3049539,size.width*0.8666324,size.height*0.3073657);
path_2.lineTo(size.width*0.8688072,size.height*0.3518598);
path_2.close();

Paint paint_2_fill = Paint()..style=PaintingStyle.fill;
paint_2_fill.color = Color(0xffED5E3D).withOpacity(1.0);
canvas.drawPath(path_2,paint_2_fill);

Path path_3 = Path();
path_3.moveTo(size.width*0.8860951,size.height*0.3075647);
path_3.lineTo(size.width*0.8798895,size.height*0.3075647);
path_3.lineTo(size.width*0.8798895,size.height*0.2021951);
path_3.cubicTo(size.width*0.8798895,size.height*0.1849235,size.width*0.8780900,size.height*0.1683598,size.width*0.8748895,size.height*0.1561471);
path_3.cubicTo(size.width*0.8716864,size.height*0.1439343,size.width*0.8673419,size.height*0.1370725,size.width*0.8628149,size.height*0.1370725);
path_3.cubicTo(size.width*0.8582853,size.height*0.1370725,size.width*0.8539409,size.height*0.1439343,size.width*0.8507404,size.height*0.1561471);
path_3.cubicTo(size.width*0.8475373,size.height*0.1683598,size.width*0.8457378,size.height*0.1849235,size.width*0.8457378,size.height*0.2021951);
path_3.lineTo(size.width*0.8457378,size.height*0.3075647);
path_3.lineTo(size.width*0.8395861,size.height*0.3075647);
path_3.lineTo(size.width*0.8395861,size.height*0.2021951);
path_3.cubicTo(size.width*0.8398715,size.height*0.1794078,size.width*0.8424473,size.height*0.1579127,size.width*0.8467763,size.height*0.1421706);
path_3.cubicTo(size.width*0.8511054,size.height*0.1264284,size.width*0.8568586,size.height*0.1176471,size.width*0.8628406,size.height*0.1176471);
path_3.cubicTo(size.width*0.8688226,size.height*0.1176471,size.width*0.8745758,size.height*0.1264284,size.width*0.8789049,size.height*0.1421706);
path_3.cubicTo(size.width*0.8832339,size.height*0.1579127,size.width*0.8858098,size.height*0.1794078,size.width*0.8860951,size.height*0.2021951);
path_3.lineTo(size.width*0.8860951,size.height*0.3075647);
path_3.close();

Paint paint_3_fill = Paint()..style=PaintingStyle.fill;
paint_3_fill.color = Color(0xffED5E3D).withOpacity(1.0);
canvas.drawPath(path_3,paint_3_fill);

}

@override
bool shouldRepaint(covariant CustomPainter oldDelegate) {
return true;
}
}