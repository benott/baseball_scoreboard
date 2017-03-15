package mx.skins.halo
{
    import mx.skins.*;

    public class SwatchPanelSkin extends Border
    {
        static const VERSION:String = "3.6.0.21751";

        public function SwatchPanelSkin()
        {
            return;
        }// end function

        override protected function updateDisplayList(param1:Number, param2:Number) : void
        {
            var _loc_3:* = 0;
            var _loc_4:* = 0;
            var _loc_5:* = 0;
            var _loc_6:* = 0;
            var _loc_7:* = NaN;
            var _loc_8:* = NaN;
            super.updateDisplayList(param1, param2);
            if (name == "swatchPanelBorder")
            {
                _loc_3 = getStyle("backgroundColor");
                _loc_4 = getStyle("borderColor");
                _loc_5 = getStyle("highlightColor");
                _loc_6 = getStyle("shadowColor");
                _loc_7 = 0;
                _loc_8 = 0;
                graphics.clear();
                drawRoundRect(_loc_7, _loc_8, param1, param2, 0, _loc_4, 1);
                drawRoundRect((_loc_7 + 1), (_loc_8 + 1), (param1 - 1), (param2 - 1), 0, _loc_6, 1);
                drawRoundRect((_loc_7 + 1), (_loc_8 + 1), param1 - 2, param2 - 2, 0, _loc_5, 1);
                drawRoundRect(_loc_7 + 2, _loc_8 + 2, param1 - 4, param2 - 4, 0, [_loc_3, _loc_5], 1, verticalGradientMatrix(_loc_7 + 2, _loc_8 + 2, param1 - 4, param2 - 4));
            }
            return;
        }// end function

    }
}
