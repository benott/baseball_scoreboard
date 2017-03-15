package mx.controls.colorPickerClasses
{
    import mx.collections.*;

    public class WebSafePalette extends Object
    {
        static const VERSION:String = "3.6.0.21751";

        public function WebSafePalette()
        {
            return;
        }// end function

        public function getList() : IList
        {
            var _loc_10:* = 0;
            var _loc_11:* = NaN;
            var _loc_12:* = null;
            var _loc_1:* = new ArrayList();
            var _loc_2:* = 0;
            var _loc_3:* = 0;
            var _loc_4:* = [0, 3355443, 6710886, 10066329, 13421772, 16777215, 16711680, 65280, 255, 16776960, 65535, 16711935];
            var _loc_5:* = ["00", "00", "00", "00", "00", "00", "33", "33", "33", "33", "33", "33", "66", "66", "66", "66", "66", "66"];
            var _loc_6:* = ["99", "99", "99", "99", "99", "99", "CC", "CC", "CC", "CC", "CC", "CC", "FF", "FF", "FF", "FF", "FF", "FF"];
            var _loc_7:* = ["00", "33", "66", "99", "CC", "FF", "00", "33", "66", "99", "CC", "FF", "00", "33", "66", "99", "CC", "FF"];
            var _loc_8:* = ["00", "33", "66", "99", "CC", "FF", "00", "33", "66", "99", "CC", "FF"];
            var _loc_9:* = 0;
            while (_loc_9 < 12)
            {
                
                _loc_10 = 0;
                while (_loc_10 < 20)
                {
                    
                    if (_loc_10 == 0)
                    {
                        _loc_11 = _loc_4[_loc_9];
                    }
                    else if (_loc_10 == 1)
                    {
                        _loc_11 = _loc_3;
                    }
                    else
                    {
                        if (_loc_9 < 6)
                        {
                            _loc_12 = _loc_5[_loc_10 - 2];
                        }
                        else
                        {
                            _loc_12 = _loc_6[_loc_10 - 2];
                        }
                        _loc_11 = Number("0x" + _loc_12 + _loc_7[_loc_10 - 2] + _loc_8[_loc_9]);
                    }
                    _loc_1.addItem(_loc_11);
                    _loc_2 = _loc_2 + 1;
                    _loc_10++;
                }
                _loc_9++;
            }
            return _loc_1;
        }// end function

    }
}
