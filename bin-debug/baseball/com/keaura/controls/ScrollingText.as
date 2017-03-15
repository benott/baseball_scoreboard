package com.keaura.controls
{
    import flash.display.*;
    import flash.events.*;
    import mx.controls.*;
    import mx.events.*;

    public class ScrollingText extends Label
    {
        private var messageSpeed:int = 2;
        private var cache:Array;
        private var secondIndex:int = 1;
        private var messageState:int = 0;
        private var textDirection:String = "rightToLeft";
        private var messageText:String;
        private var _1550783935running:Boolean = false;
        private var currentIndex:int = 0;
        private var clipMask:Shape;
        public static const BLINK:String = "blink";
        public static const BOTTOM_TO_TOP:String = "bottomToTop";
        public static const RIGHT_TO_LEFT:String = "rightToLeft";
        public static const TOP_TO_BOTTOM:String = "topToBottom";
        public static const STATIC:String = "static";
        public static const LEFT_TO_RIGHT:String = "leftToRight";

        public function ScrollingText()
        {
            return;
        }// end function

        override protected function updateDisplayList(param1:Number, param2:Number) : void
        {
            super.updateDisplayList(param1, param2);
            var _loc_3:* = this.cache[0] as Label;
            var _loc_4:* = this.cache[1] as Label;
            var _loc_5:* = (param1 - _loc_3.width) / 2;
            var _loc_6:* = (param2 - _loc_3.height) / 2;
            switch(this.direction)
            {
                case RIGHT_TO_LEFT:
                {
                    _loc_4.move(param1, _loc_6);
                    _loc_3.move(Math.max(param1 + 20, _loc_4.width + 20), _loc_6);
                    break;
                }
                case LEFT_TO_RIGHT:
                {
                    _loc_3.move(-_loc_3.width, _loc_6);
                    _loc_4.move(-_loc_4.width - 20, _loc_6);
                    break;
                }
                case BOTTOM_TO_TOP:
                {
                    _loc_3.move(_loc_5, param2);
                    _loc_4.move(_loc_5, param2);
                    break;
                }
                case TOP_TO_BOTTOM:
                {
                    _loc_3.move(_loc_5, -_loc_3.height);
                    _loc_4.move(_loc_5, -_loc_4.height);
                    break;
                }
                case BLINK:
                case STATIC:
                {
                    _loc_3.x = (288 - _loc_3.width) / 2;
                    _loc_4.visible = false;
                    break;
                }
                default:
                {
                    break;
                }
            }
            this.clipMask.graphics.clear();
            this.clipMask.graphics.beginFill(0);
            this.clipMask.graphics.drawRect(0, 0, param1, param2);
            this.clipMask.graphics.endFill();
            return;
        }// end function

        public function stop() : void
        {
            if (this.running)
            {
                removeEventListener(Event.ENTER_FRAME, this.moveText);
            }
            this.running = false;
            return;
        }// end function

        public function set running(param1:Boolean) : void
        {
            var _loc_2:* = this._1550783935running;
            if (_loc_2 !== param1)
            {
                this._1550783935running = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "running", _loc_2, param1));
            }
            return;
        }// end function

        public function get speed() : int
        {
            return this.messageSpeed;
        }// end function

        override protected function commitProperties() : void
        {
            if (this.text == null)
            {
                this.messageText = "";
            }
            if (this.isHTML)
            {
                htmlText = this.text;
                this.cache[0].htmlText = htmlText;
                this.cache[0].selectable = false;
                this.cache[1].htmlText = htmlText;
                this.cache[1].selectable = false;
            }
            else
            {
                this.cache[0].text = this.text;
                this.cache[0].selectable = false;
                this.cache[1].text = this.text;
                this.cache[1].selectable = false;
            }
            this.cache[0].validateNow();
            this.cache[1].validateNow();
            invalidateSize();
            invalidateDisplayList();
            return;
        }// end function

        public function set speed(param1:int) : void
        {
            if (param1 < 1)
            {
                param1 = 1;
            }
            this.messageSpeed = param1;
            return;
        }// end function

        public function get running() : Boolean
        {
            return this._1550783935running;
        }// end function

        override public function set text(param1:String) : void
        {
            this.messageText = param1;
            invalidateProperties();
            this.currentIndex = 0;
            this.secondIndex = 1;
            return;
        }// end function

        override protected function measure() : void
        {
            var _loc_2:* = null;
            super.measure();
            measuredWidth = 0;
            measuredHeight = 0;
            var _loc_1:* = 0;
            while (_loc_1 < this.cache.length)
            {
                
                _loc_2 = this.cache[_loc_1] as Label;
                _loc_2.setActualSize(_loc_2.getExplicitOrMeasuredWidth(), _loc_2.getExplicitOrMeasuredHeight());
                measuredWidth = Math.max(measuredWidth, _loc_2.getExplicitOrMeasuredWidth());
                measuredHeight = Math.max(measuredHeight, _loc_2.getExplicitOrMeasuredHeight());
                _loc_1++;
            }
            return;
        }// end function

        override protected function createChildren() : void
        {
            super.createChildren();
            this.cache = [new Label(), new Label()];
            (this.cache[0] as Label).styleName = this;
            (this.cache[0] as Label).cacheAsBitmap = true;
            addChild(this.cache[0]);
            (this.cache[1] as Label).styleName = this;
            (this.cache[1] as Label).cacheAsBitmap = true;
            addChild(this.cache[1]);
            this.clipMask = new Shape();
            addChild(this.clipMask);
            mask = this.clipMask;
            return;
        }// end function

        private function moveText(event:Event) : void
        {
            if (this.direction == RIGHT_TO_LEFT)
            {
                this.cache[this.currentIndex].x = this.cache[this.currentIndex].x - this.messageSpeed;
                if (this.cache[this.currentIndex].x <= 0)
                {
                    this.cache[this.secondIndex].x = this.cache[this.secondIndex].x - this.messageSpeed;
                }
                if (this.cache[this.currentIndex].x + this.cache[this.currentIndex].width <= 0)
                {
                    this.cache[this.currentIndex].x = Math.max(this.cache[this.currentIndex].parent.width, this.cache[this.secondIndex].width + 20);
                    this.currentIndex = 1 - this.currentIndex;
                    this.secondIndex = 1 - this.secondIndex;
                }
            }
            else if (this.direction == LEFT_TO_RIGHT)
            {
                this.cache[this.currentIndex].x = this.cache[this.currentIndex].x + this.messageSpeed;
                if (this.cache[this.currentIndex].x > 0 && this.cache[this.currentIndex].x + this.cache[this.currentIndex].width > this.cache[this.currentIndex].parent.width)
                {
                    this.cache[this.secondIndex].x = this.cache[this.secondIndex].x + this.messageSpeed;
                }
                if (this.cache[this.currentIndex].x > this.cache[this.currentIndex].parent.width)
                {
                    this.cache[this.currentIndex].x = -this.cache[this.currentIndex].width - 10;
                    this.currentIndex = 1 - this.currentIndex;
                    this.secondIndex = 1 - this.secondIndex;
                }
            }
            else if (this.direction == BOTTOM_TO_TOP)
            {
                this.cache[this.currentIndex].y = this.cache[this.currentIndex].y - this.messageSpeed;
                if (this.cache[this.currentIndex].y <= 0)
                {
                    this.cache[this.secondIndex].y = this.cache[this.secondIndex].y - this.messageSpeed;
                }
                if (this.cache[this.currentIndex].y + this.cache[this.currentIndex].height <= 0)
                {
                    this.cache[this.currentIndex].y = this.cache[this.currentIndex].parent.height;
                    this.currentIndex = 1 - this.currentIndex;
                    this.secondIndex = 1 - this.secondIndex;
                }
            }
            else if (this.direction == TOP_TO_BOTTOM)
            {
                this.cache[this.currentIndex].y = this.cache[this.currentIndex].y + this.messageSpeed;
                if (this.cache[this.currentIndex].y + this.cache[this.currentIndex].height > this.cache[this.currentIndex].parent.height)
                {
                    this.cache[this.secondIndex].y = this.cache[this.secondIndex].y + this.messageSpeed;
                }
                if (this.cache[this.currentIndex].y > this.cache[this.currentIndex].parent.height)
                {
                    this.cache[this.currentIndex].y = -this.cache[this.currentIndex].height;
                    this.currentIndex = 1 - this.currentIndex;
                    this.secondIndex = 1 - this.secondIndex;
                }
            }
            else if (this.direction == BLINK)
            {
                if (this.messageState >= 20 / this.messageSpeed)
                {
                    if ((this.cache[0] as Label).visible == true)
                    {
                        (this.cache[0] as Label).visible = false;
                    }
                    else
                    {
                        (this.cache[0] as Label).visible = true;
                    }
                    this.messageState = 0;
                }
                else
                {
                    var _loc_2:* = this;
                    var _loc_3:* = this.messageState + 1;
                    _loc_2.messageState = _loc_3;
                }
            }
            return;
        }// end function

        public function start() : void
        {
            if (!this.running)
            {
                addEventListener(Event.ENTER_FRAME, this.moveText);
            }
            this.running = true;
            return;
        }// end function

        override public function get text() : String
        {
            return this.messageText;
        }// end function

        private function get isHTML() : Boolean
        {
            if (this.text.charAt(0) == "<")
            {
                return true;
            }
            return false;
        }// end function

        public function set direction(param1:String) : void
        {
            this.textDirection = param1;
            invalidateProperties();
            return;
        }// end function

        public function get direction() : String
        {
            return this.textDirection;
        }// end function

    }
}
