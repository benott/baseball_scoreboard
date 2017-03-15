package 
{
    import AbstractVideoObject.*;
    import mx.containers.*;

    public class AbstractVideoObject extends Canvas
    {
        private var _name:String = "";

        public function AbstractVideoObject(param1:String)
        {
            this.width = 288;
            this.height = 32;
            this._name = param1;
            return;
        }// end function

        public function reload() : void
        {
            return;
        }// end function

        override public function get name() : String
        {
            return this._name;
        }// end function

        public function stop() : void
        {
            return;
        }// end function

        public function play() : void
        {
            return;
        }// end function

    }
}
