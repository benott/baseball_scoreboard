﻿package mx.managers
{
    import flash.display.*;
    import flash.geom.*;
    import mx.core.*;

    public class SystemChildrenList extends Object implements IChildList
    {
        private var lowerBoundReference:QName;
        private var upperBoundReference:QName;
        private var owner:SystemManager;
        static const VERSION:String = "3.6.0.21751";

        public function SystemChildrenList(param1:SystemManager, param2:QName, param3:QName)
        {
            this.owner = param1;
            this.lowerBoundReference = param2;
            this.upperBoundReference = param3;
            return;
        }// end function

        public function getChildAt(param1:int) : DisplayObject
        {
            var _loc_3:* = owner;
            var _loc_2:* = _loc_3.mx_internal::rawChildren_getChildAt(_loc_3[lowerBoundReference] + param1);
            return _loc_2;
        }// end function

        public function getChildByName(param1:String) : DisplayObject
        {
            var _loc_2:* = owner;
            return _loc_2.mx_internal::rawChildren_getChildByName(param1);
        }// end function

        public function removeChildAt(param1:int) : DisplayObject
        {
            var _loc_3:* = owner;
            var _loc_2:* = _loc_3.mx_internal::rawChildren_removeChildAt(param1 + _loc_3[lowerBoundReference]);
            var _loc_3:* = owner;
            var _loc_4:* = upperBoundReference;
            var _loc_5:* = _loc_3[upperBoundReference] - 1;
            _loc_3[_loc_4] = _loc_5;
            return _loc_2;
        }// end function

        public function getChildIndex(param1:DisplayObject) : int
        {
            var _loc_3:* = owner;
            var _loc_2:* = _loc_3.mx_internal::rawChildren_getChildIndex(param1);
            _loc_2 = _loc_2 - _loc_3[lowerBoundReference];
            return _loc_2;
        }// end function

        public function addChildAt(param1:DisplayObject, param2:int) : DisplayObject
        {
            var _loc_3:* = owner;
            _loc_3.mx_internal::rawChildren_addChildAt(param1, _loc_3[lowerBoundReference] + param2);
            var _loc_3:* = owner;
            var _loc_4:* = upperBoundReference;
            var _loc_5:* = _loc_3[upperBoundReference] + 1;
            _loc_3[_loc_4] = _loc_5;
            return param1;
        }// end function

        public function getObjectsUnderPoint(param1:Point) : Array
        {
            var _loc_2:* = owner;
            return _loc_2.mx_internal::rawChildren_getObjectsUnderPoint(param1);
        }// end function

        public function setChildIndex(param1:DisplayObject, param2:int) : void
        {
            var _loc_3:* = owner;
            _loc_3.mx_internal::rawChildren_setChildIndex(param1, _loc_3[lowerBoundReference] + param2);
            return;
        }// end function

        public function get numChildren() : int
        {
            return owner[upperBoundReference] - owner[lowerBoundReference];
        }// end function

        public function contains(param1:DisplayObject) : Boolean
        {
            var _loc_2:* = 0;
            var _loc_3:* = owner;
            if (param1 != owner && _loc_3.mx_internal::rawChildren_contains(param1))
            {
                while (param1.parent != owner)
                {
                    
                    param1 = param1.parent;
                }
                var _loc_3:* = owner;
                _loc_2 = _loc_3.mx_internal::rawChildren_getChildIndex(param1);
                if (_loc_2 >= _loc_3[lowerBoundReference] && _loc_2 < _loc_3[upperBoundReference])
                {
                    return true;
                }
            }
            return false;
        }// end function

        public function removeChild(param1:DisplayObject) : DisplayObject
        {
            var _loc_3:* = owner;
            var _loc_2:* = _loc_3.mx_internal::rawChildren_getChildIndex(param1);
            if (_loc_3[lowerBoundReference] <= _loc_2 && _loc_2 < _loc_3[upperBoundReference])
            {
                var _loc_3:* = owner;
                _loc_3.mx_internal::rawChildren_removeChild(param1);
                var _loc_3:* = owner;
                var _loc_4:* = upperBoundReference;
                var _loc_5:* = _loc_3[upperBoundReference] - 1;
                _loc_3[_loc_4] = _loc_5;
            }
            return param1;
        }// end function

        public function addChild(param1:DisplayObject) : DisplayObject
        {
            var _loc_2:* = owner;
            _loc_2.mx_internal::rawChildren_addChildAt(param1, _loc_2[upperBoundReference]);
            var _loc_2:* = owner;
            var _loc_3:* = upperBoundReference;
            var _loc_4:* = _loc_2[upperBoundReference] + 1;
            _loc_2[_loc_3] = _loc_4;
            return param1;
        }// end function

    }
}
