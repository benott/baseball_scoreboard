package mx.events
{
    import flash.events.*;

    public class ColorPickerEvent extends Event
    {
        public var index:int;
        public var color:uint;
        public static const ITEM_ROLL_OVER:String = "itemRollOver";
        public static const CHANGE:String = "change";
        static const VERSION:String = "3.6.0.21751";
        public static const ITEM_ROLL_OUT:String = "itemRollOut";
        public static const ENTER:String = "enter";

        public function ColorPickerEvent(param1:String, param2:Boolean = false, param3:Boolean = false, param4:int = -1, param5:uint = 4.29497e+09)
        {
            super(param1, param2, param3);
            this.index = param4;
            this.color = param5;
            return;
        }// end function

        override public function clone() : Event
        {
            return new ColorPickerEvent(type, bubbles, cancelable, index, color);
        }// end function

    }
}
