﻿package mx.validators
{

    public class ValidationResult extends Object
    {
        public var subField:String;
        public var errorCode:String;
        public var isError:Boolean;
        public var errorMessage:String;
        static const VERSION:String = "3.6.0.21751";

        public function ValidationResult(param1:Boolean, param2:String = "", param3:String = "", param4:String = "")
        {
            this.isError = param1;
            this.subField = param2;
            this.errorMessage = param4;
            this.errorCode = param3;
            return;
        }// end function

    }
}
