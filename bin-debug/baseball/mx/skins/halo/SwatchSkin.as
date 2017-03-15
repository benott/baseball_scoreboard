package mx.skins.halo
{
    import flash.display.*;
    import mx.collections.*;
    import mx.core.*;

    public class SwatchSkin extends UIComponent
    {
        var color:uint = 0;
        var colorField:String = "color";
        static const VERSION:String = "3.6.0.21751";

        public function SwatchSkin()
        {
            return;
        }// end function

        private function drawSwatch(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number) : void
        {
            var _loc_6:* = getStyle("swatchBorderColor");
            var _loc_7:* = getStyle("swatchBorderSize");
            if (_loc_7 == 0)
            {
                drawFill(param1, param2, param3, param4, param5, 1);
            }
            else if (_loc_7 < 0 || isNaN(_loc_7))
            {
                drawFill(param1, param2, param3, param4, _loc_6, 1);
                drawFill((param1 + 1), (param2 + 1), param3 - 2, param4 - 2, param5, 1);
            }
            else
            {
                drawFill(param1, param2, param3, param4, _loc_6, 1);
                drawFill(param1 + _loc_7, param2 + _loc_7, param3 - 2 * _loc_7, param4 - 2 * _loc_7, param5, 1);
            }
            return;
        }// end function

        function updateGrid(param1:IList) : void
        {
            if (name == "swatchGrid")
            {
                graphics.clear();
                drawGrid(param1, colorField);
            }
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

        override protected function updateDisplayList(param1:Number, param2:Number) : void
        {
            super.updateDisplayList(param1, param2);
            updateSkin(color);
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

        private function drawGrid(param1:IList, param2:String) : void
        {
            var _loc_22:* = NaN;
            var _loc_23:* = NaN;
            var _loc_24:* = NaN;
            var _loc_3:* = getStyle("columnCount");
            var _loc_4:* = getStyle("horizontalGap");
            var _loc_5:* = getStyle("previewWidth");
            var _loc_6:* = getStyle("swatchGridBackgroundColor");
            var _loc_7:* = getStyle("swatchGridBorderSize");
            var _loc_8:* = getStyle("swatchHeight");
            var _loc_9:* = getStyle("swatchWidth");
            var _loc_10:* = getStyle("textFieldWidth");
            var _loc_11:* = getStyle("verticalGap");
            var _loc_12:* = 1;
            var _loc_13:* = 3;
            var _loc_14:* = param1.length;
            if (_loc_3 > _loc_14)
            {
                _loc_3 = _loc_14;
            }
            var _loc_15:* = Math.ceil(_loc_14 / _loc_3);
            if (isNaN(_loc_15))
            {
                _loc_15 = 0;
            }
            var _loc_16:* = _loc_3 * (_loc_9 - _loc_12) + _loc_12 + (_loc_3 - 1) * _loc_4 + 2 * _loc_7;
            var _loc_17:* = _loc_15 * (_loc_8 - _loc_12) + _loc_12 + (_loc_15 - 1) * _loc_11 + 2 * _loc_7;
            var _loc_18:* = _loc_5 + _loc_10 + _loc_13;
            if (_loc_16 < _loc_18)
            {
                _loc_16 = _loc_18;
            }
            drawFill(0, 0, _loc_16, _loc_17, _loc_6, 100);
            setActualSize(_loc_16, _loc_17);
            var _loc_19:* = 0;
            var _loc_20:* = 0;
            var _loc_21:* = 0;
            while (_loc_21 < _loc_14)
            {
                
                _loc_22 = _loc_7 + _loc_19 * (_loc_9 + _loc_4 - _loc_12);
                _loc_23 = _loc_7 + _loc_20 * (_loc_8 + _loc_11 - _loc_12);
                _loc_24 = typeof(param1.getItemAt(_loc_21)) != "object" ? (Number(param1.getItemAt(_loc_21))) : (Number(param1.getItemAt(_loc_21)[colorField]));
                drawSwatch(_loc_22, _loc_23, _loc_9, _loc_8, _loc_24);
                if (_loc_19 < (_loc_3 - 1))
                {
                    _loc_19++;
                }
                else
                {
                    _loc_19 = 0;
                    _loc_20++;
                }
                _loc_21++;
            }
            return;
        }// end function

        function updateSkin(param1:Number) : void
        {
            var _loc_3:* = NaN;
            var _loc_4:* = NaN;
            var _loc_5:* = NaN;
            var _loc_6:* = NaN;
            var _loc_7:* = NaN;
            var _loc_8:* = NaN;
            var _loc_9:* = 0;
            var _loc_10:* = NaN;
            var _loc_2:* = graphics;
            switch(name)
            {
                case "colorPickerSwatch":
                {
                    _loc_3 = UIComponent(parent).width / Math.abs(UIComponent(parent).scaleX);
                    _loc_4 = UIComponent(parent).height / Math.abs(UIComponent(parent).scaleY);
                    _loc_2.clear();
                    drawSwatch(0, 0, _loc_3, _loc_4, param1);
                    break;
                }
                case "swatchPreview":
                {
                    _loc_5 = getStyle("previewWidth");
                    _loc_6 = getStyle("previewHeight");
                    _loc_2.clear();
                    drawSwatch(0, 0, _loc_5, _loc_6, param1);
                    drawBorder(0, 0, _loc_5, _loc_6, 10066329, 16777215, 1, 1);
                    break;
                }
                case "swatchHighlight":
                {
                    _loc_7 = getStyle("swatchWidth");
                    _loc_8 = getStyle("swatchHeight");
                    _loc_9 = getStyle("swatchHighlightColor");
                    _loc_10 = getStyle("swatchHighlightSize");
                    _loc_2.clear();
                    drawBorder(0, 0, _loc_7, _loc_8, _loc_9, _loc_9, _loc_10, 1);
                    break;
                }
                default:
                {
                    break;
                }
            }
            return;
        }// end function

    }
}
