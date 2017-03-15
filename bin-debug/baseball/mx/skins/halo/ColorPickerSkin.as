package mx.skins.halo
{
    import flash.display.*;
    import mx.skins.*;

    public class ColorPickerSkin extends Border
    {
        private var borderHighlightColor:uint = 16711422;
        private var borderSize:Number = 1;
        private var arrowHeight:Number = 5;
        private var backgroundColor:uint = 15066855;
        private var borderShadowColor:uint = 10132381;
        private var bevelSize:Number = 1;
        private var arrowWidth:Number = 7;
        static const VERSION:String = "3.6.0.21751";

        public function ColorPickerSkin()
        {
            return;
        }// end function

        private function drawFill(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number) : void
        {
            var _loc_7:* = graphics;
            _loc_7.moveTo(param1, param2);
            _loc_7.beginFill(param5, param6);
            _loc_7.lineTo(param1 + param3, param2);
            _loc_7.lineTo(param1 + param3, param4 + param2);
            _loc_7.lineTo(param1, param4 + param2);
            _loc_7.lineTo(param1, param2);
            _loc_7.endFill();
            return;
        }// end function

        private function drawArrow(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number) : void
        {
            var _loc_7:* = graphics;
            _loc_7.moveTo(param1, param2);
            _loc_7.beginFill(param5, param6);
            _loc_7.lineTo(param1 + param3, param2);
            _loc_7.lineTo(param1 + param3 / 2, param4 + param2);
            _loc_7.lineTo(param1, param2);
            _loc_7.endFill();
            return;
        }// end function

        override protected function updateDisplayList(param1:Number, param2:Number) : void
        {
            super.updateDisplayList(param1, param2);
            var _loc_3:* = getStyle("iconColor");
            var _loc_4:* = param1 - arrowWidth - bevelSize;
            var _loc_5:* = param2 - arrowHeight - bevelSize;
            graphics.clear();
            if (name == "upSkin" || name == "overSkin")
            {
                drawFill(x, y, param1 + bevelSize, param2 + bevelSize, 13421772, 0);
                drawBorder(x, y, param1, param2, borderHighlightColor, borderShadowColor, bevelSize, 1);
                drawBorder(x + bevelSize, y + bevelSize, param1 - bevelSize * 2, param2 - bevelSize * 2, backgroundColor, backgroundColor, borderSize, 1);
                drawBorder(x + bevelSize + borderSize, y + bevelSize + borderSize, param1 - (bevelSize + borderSize) * 2, param2 - (bevelSize + borderSize) * 2, borderShadowColor, borderHighlightColor, bevelSize, 1);
                drawFill(_loc_4, _loc_5, arrowWidth, arrowHeight, backgroundColor, 1);
                drawArrow(_loc_4 + 1.5, _loc_5 + 1.5, arrowWidth - 3, arrowHeight - 3, _loc_3, 1);
            }
            else if (name == "downSkin")
            {
                drawFill(x, y, param1, param2, 13421772, 0);
                drawBorder(x, y, param1, param2, borderHighlightColor, 13421772, bevelSize, 1);
                drawBorder(x + bevelSize, y + bevelSize, param1 - 2 * bevelSize, param2 - 2 * bevelSize, backgroundColor, backgroundColor, borderSize, 1);
                drawBorder(x + bevelSize + borderSize, y + bevelSize + borderSize, param1 - 2 * (bevelSize + borderSize), param2 - 2 * (bevelSize + borderSize), borderShadowColor, borderHighlightColor, bevelSize, 1);
                drawFill(_loc_4, _loc_5, arrowWidth, arrowHeight, backgroundColor, 1);
                drawArrow(_loc_4 + 1.5, _loc_5 + 1.5, arrowWidth - 3, arrowHeight - 3, _loc_3, 1);
            }
            else if (name == "disabledSkin")
            {
                _loc_3 = getStyle("disabledIconColor");
                drawRoundRect(x, y, param1, param2, 0, 16777215, 0.6);
                drawFill(x, y, param1, param2, 16777215, 0.25);
                drawBorder(x, y, param1, param2, borderHighlightColor, 13421772, bevelSize, 1);
                drawBorder(x + bevelSize, y + bevelSize, param1 - bevelSize * 2, param2 - bevelSize * 2, backgroundColor, backgroundColor, borderSize, 1);
                drawBorder(x + bevelSize + borderSize, y + bevelSize + borderSize, param1 - 2 * (bevelSize + borderSize), param2 - 2 * (bevelSize + borderSize), borderShadowColor, borderHighlightColor, bevelSize, 1);
                drawFill(_loc_4, _loc_5, arrowWidth, arrowHeight, backgroundColor, 1);
                drawArrow(_loc_4 + 1.5, _loc_5 + 1.5, arrowWidth - 3, arrowHeight - 3, _loc_3, 1);
            }
            return;
        }// end function

        private function drawBorder(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number) : void
        {
            drawFill(param1, param2, param7, param4, param5, param8);
            drawFill(param1, param2, param3, param7, param5, param8);
            drawFill(param1 + (param3 - param7), param2, param7, param4, param6, param8);
            drawFill(param1, param2 + (param4 - param7), param3, param7, param6, param8);
            return;
        }// end function

    }
}
