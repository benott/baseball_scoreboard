package mx.controls.colorPickerClasses
{
    import flash.events.*;
    import flash.geom.*;
    import flash.ui.*;
    import mx.collections.*;
    import mx.controls.*;
    import mx.core.*;
    import mx.events.*;
    import mx.managers.*;
    import mx.skins.halo.*;
    import mx.styles.*;

    public class SwatchPanel extends UIComponent implements IFocusManagerContainer
    {
        private var _labelField:String = "label";
        private var horizontalGap:Number;
        private var previewHeight:Number;
        private var border:SwatchPanelSkin;
        private var grid:Rectangle;
        private var initializing:Boolean = true;
        private var _showTextField:Boolean = true;
        private var columnCount:int;
        private var indexFlag:Boolean = false;
        var tweenUp:Boolean = false;
        private var verticalGap:Number;
        private var swatchHeight:Number;
        var isOverGrid:Boolean = false;
        private var itemOffset:Number = 3;
        private var _selectedColor:uint = 0;
        private var paddingRight:Number;
        private var swatchGridBorderSize:Number;
        private var paddingTop:Number;
        private var cellOffset:Number = 1;
        var focusedIndex:int = -1;
        var textInput:TextInput;
        private var _dataProvider:IList;
        private var paddingBottom:Number;
        private var highlight:SwatchSkin;
        private var paddingLeft:Number;
        private var preview:SwatchSkin;
        private var _editable:Boolean = true;
        var isOpening:Boolean = false;
        private var rows:int;
        private var lastIndex:int = -1;
        private var previewWidth:Number;
        private var swatchWidth:Number;
        private var swatches:SwatchSkin;
        private var _colorField:String = "color";
        private var _selectedIndex:int = 0;
        private var textFieldWidth:Number;
        static const VERSION:String = "3.6.0.21751";

        public function SwatchPanel()
        {
            addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
            addEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
            return;
        }// end function

        public function set selectedColor(param1:uint) : void
        {
            var _loc_2:* = 0;
            if (!indexFlag)
            {
                _loc_2 = findColorByName(param1);
                if (_loc_2 != -1)
                {
                    focusedIndex = findColorByName(param1);
                    _selectedIndex = focusedIndex;
                }
                else
                {
                    selectedIndex = -1;
                }
            }
            else
            {
                indexFlag = false;
            }
            if (param1 != selectedColor || !isOverGrid || isOpening)
            {
                _selectedColor = param1;
                updateColor(param1);
                if (isOverGrid || isOpening)
                {
                    setFocusOnSwatch(selectedIndex);
                }
                if (isOpening)
                {
                    isOpening = false;
                }
            }
            return;
        }// end function

        private function updateColor(param1:uint) : void
        {
            var _loc_2:* = null;
            if (initializing || isNaN(param1))
            {
                return;
            }
            preview.updateSkin(param1);
            if (isOverGrid)
            {
                _loc_2 = null;
                if (focusedIndex >= 0 && typeof(dataProvider.getItemAt(focusedIndex)) == "object")
                {
                    _loc_2 = dataProvider.getItemAt(focusedIndex)[labelField];
                }
                textInput.text = _loc_2 != null && _loc_2.length != 0 ? (_loc_2) : (rgbToHex(param1));
            }
            return;
        }// end function

        override protected function createChildren() : void
        {
            super.createChildren();
            if (!border)
            {
                border = new SwatchPanelSkin();
                border.styleName = this;
                border.name = "swatchPanelBorder";
                addChild(border);
            }
            if (!preview)
            {
                preview = new SwatchSkin();
                preview.styleName = this;
                preview.color = selectedColor;
                preview.name = "swatchPreview";
                preview.setStyle("swatchBorderSize", 0);
                addChild(preview);
            }
            if (!textInput)
            {
                textInput = new TextInput();
                if (FlexVersion.compatibilityVersion < FlexVersion.VERSION_3_0)
                {
                    textInput.styleName = this;
                    textInput.setStyle("borderCapColor", 9542041);
                    textInput.setStyle("buttonColor", 7305079);
                    textInput.setStyle("highlightColor", 12897484);
                    textInput.setStyle("shadowColor", 12);
                    textInput.setStyle("shadowCapColor", 14015965);
                    textInput.setStyle("borderStyle", "inset");
                    textInput.setStyle("backgroundColor", 16777215);
                    textInput.setStyle("borderColor", 14015965);
                }
                else
                {
                    textInput.styleName = getStyle("textFieldStyleName");
                }
                textInput.editable = _editable;
                textInput.maxChars = 6;
                textInput.name = "inset";
                textInput.text = rgbToHex(selectedColor);
                textInput.restrict = "#xa-fA-F0-9";
                textInput.addEventListener(Event.CHANGE, textInput_changeHandler);
                textInput.addEventListener(KeyboardEvent.KEY_DOWN, textInput_keyDownHandler);
                addChild(textInput);
            }
            if (!swatches)
            {
                swatches = new SwatchSkin();
                swatches.styleName = this;
                swatches.colorField = colorField;
                swatches.name = "swatchGrid";
                swatches.addEventListener(MouseEvent.CLICK, swatches_clickHandler);
                addChild(swatches);
            }
            if (!highlight)
            {
                highlight = new SwatchSkin();
                highlight.styleName = this;
                highlight.visible = false;
                highlight.name = "swatchHighlight";
                addChild(highlight);
            }
            refresh();
            initializing = false;
            return;
        }// end function

        override public function get height() : Number
        {
            return getExplicitOrMeasuredHeight();
        }// end function

        private function textInput_keyDownHandler(event:KeyboardEvent) : void
        {
            ColorPicker(owner).dispatchEvent(event);
            return;
        }// end function

        private function findColorByName(param1:Number) : int
        {
            if (param1 == getColor(selectedIndex))
            {
                return selectedIndex;
            }
            var _loc_2:* = 0;
            while (_loc_2 < length)
            {
                
                if (param1 == getColor(_loc_2))
                {
                    return _loc_2;
                }
                _loc_2++;
            }
            return -1;
        }// end function

        override public function set height(param1:Number) : void
        {
            return;
        }// end function

        public function get showTextField() : Boolean
        {
            return _showTextField;
        }// end function

        private function mouseMoveHandler(event:MouseEvent) : void
        {
            var _loc_2:* = null;
            var _loc_3:* = NaN;
            var _loc_4:* = NaN;
            var _loc_5:* = NaN;
            if (ColorPicker(owner).isDown && enabled)
            {
                if (mouseX > grid.left && mouseX < grid.right && mouseY > grid.top && mouseY < grid.bottom)
                {
                    _loc_3 = Math.floor((Math.floor(mouseX) - (grid.left + verticalGap)) / (swatchWidth + horizontalGap - cellOffset));
                    _loc_4 = Math.floor((Math.floor(mouseY) - grid.top) / (swatchHeight + verticalGap - cellOffset));
                    _loc_5 = _loc_4 * columnCount + _loc_3;
                    if (_loc_3 == -1)
                    {
                        _loc_5 = _loc_5 + 1;
                    }
                    else if (_loc_3 > (columnCount - 1))
                    {
                        _loc_5 = _loc_5 - 1;
                    }
                    else if (_loc_4 > (rows - 1))
                    {
                        _loc_5 = _loc_5 - columnCount;
                    }
                    else if (_loc_5 < 0)
                    {
                        _loc_5 = _loc_5 + columnCount;
                    }
                    if ((lastIndex != _loc_5 || highlight.visible == false) && _loc_5 < length)
                    {
                        if (lastIndex != -1 && lastIndex != _loc_5)
                        {
                            _loc_2 = new ColorPickerEvent(ColorPickerEvent.ITEM_ROLL_OUT);
                            _loc_2.index = lastIndex;
                            _loc_2.color = getColor(lastIndex);
                            dispatchEvent(_loc_2);
                        }
                        focusedIndex = _loc_5;
                        lastIndex = focusedIndex;
                        setFocusOnSwatch(focusedIndex);
                        _loc_2 = new ColorPickerEvent(ColorPickerEvent.ITEM_ROLL_OVER);
                        _loc_2.index = focusedIndex;
                        _loc_2.color = getColor(focusedIndex);
                        dispatchEvent(_loc_2);
                    }
                }
                else
                {
                    if (highlight.visible == true && isOverGrid && lastIndex != -1)
                    {
                        highlight.visible = false;
                        _loc_2 = new ColorPickerEvent(ColorPickerEvent.ITEM_ROLL_OUT);
                        _loc_2.index = lastIndex;
                        _loc_2.color = getColor(lastIndex);
                        dispatchEvent(_loc_2);
                    }
                    isOverGrid = false;
                }
            }
            return;
        }// end function

        public function get colorField() : String
        {
            return _colorField;
        }// end function

        public function get selectedItem() : Object
        {
            return dataProvider ? (dataProvider.getItemAt(selectedIndex)) : (null);
        }// end function

        private function textInput_changeHandler(event:Event) : void
        {
            var _loc_2:* = TextInput(event.target).text;
            if (_loc_2.charAt(0) == "#")
            {
                textInput.maxChars = 7;
                _loc_2 = "0x" + _loc_2.substring(1);
            }
            else if (_loc_2.substring(0, 2) == "0x")
            {
                textInput.maxChars = 8;
            }
            else
            {
                textInput.maxChars = 6;
                _loc_2 = "0x" + _loc_2;
            }
            highlight.visible = false;
            isOverGrid = false;
            selectedColor = Number(_loc_2);
            dispatchEvent(new Event("change"));
            return;
        }// end function

        public function get editable() : Boolean
        {
            return _editable;
        }// end function

        override protected function measure() : void
        {
            super.measure();
            swatches.updateGrid(IList(dataProvider));
            measuredWidth = Math.max(paddingLeft + paddingRight + swatches.width, 100);
            measuredHeight = Math.max(paddingTop + previewHeight + itemOffset + paddingBottom + swatches.height, 100);
            return;
        }// end function

        override protected function keyDownHandler(event:KeyboardEvent) : void
        {
            if (event.eventPhase != EventPhase.AT_TARGET || !enabled)
            {
                return;
            }
            if (focusedIndex == -1 || isNaN(focusedIndex))
            {
                focusedIndex = 0;
            }
            var _loc_2:* = Math.floor(focusedIndex / columnCount);
            switch(event.keyCode)
            {
                case Keyboard.UP:
                {
                    focusedIndex = focusedIndex - columnCount < 0 ? ((rows - 1) * columnCount + focusedIndex + 1) : (focusedIndex - columnCount);
                    isOverGrid = true;
                    break;
                }
                case Keyboard.DOWN:
                {
                    focusedIndex = focusedIndex + columnCount > length ? ((focusedIndex - 1) - (rows - 1) * columnCount) : (focusedIndex + columnCount);
                    isOverGrid = true;
                    break;
                }
                case Keyboard.LEFT:
                {
                    focusedIndex = focusedIndex < 1 ? ((length - 1)) : ((focusedIndex - 1));
                    isOverGrid = true;
                    break;
                }
                case Keyboard.RIGHT:
                {
                    focusedIndex = focusedIndex >= (length - 1) ? (0) : ((focusedIndex + 1));
                    isOverGrid = true;
                    break;
                }
                case Keyboard.PAGE_UP:
                {
                    focusedIndex = focusedIndex - _loc_2 * columnCount;
                    isOverGrid = true;
                    break;
                }
                case Keyboard.PAGE_DOWN:
                {
                    focusedIndex = focusedIndex + (rows - 1) * columnCount - _loc_2 * columnCount;
                    isOverGrid = true;
                    break;
                }
                case Keyboard.HOME:
                {
                    focusedIndex = focusedIndex - (focusedIndex - _loc_2 * columnCount);
                    isOverGrid = true;
                    break;
                }
                case Keyboard.END:
                {
                    focusedIndex = focusedIndex + (_loc_2 * columnCount - focusedIndex) + (columnCount - 1);
                    isOverGrid = true;
                    break;
                }
                default:
                {
                    break;
                }
            }
            if (focusedIndex < length && isOverGrid)
            {
                setFocusOnSwatch(focusedIndex);
                dispatchEvent(new Event("change"));
            }
            return;
        }// end function

        public function get labelField() : String
        {
            return _labelField;
        }// end function

        public function set dataProvider(param1:Object) : void
        {
            var _loc_2:* = null;
            if (param1 is IList)
            {
                _dataProvider = IList(param1);
            }
            else if (param1 is Array)
            {
                _loc_2 = new ArrayList(param1 as Array);
                param1 = _loc_2;
            }
            else
            {
                _dataProvider = null;
            }
            if (!initializing)
            {
                if (length == 0 || isNaN(length))
                {
                    highlight.visible = false;
                    _selectedIndex = -1;
                }
                refresh();
            }
            return;
        }// end function

        public function get selectedColor() : uint
        {
            return _selectedColor;
        }// end function

        override public function setFocus() : void
        {
            if (showTextField && editable)
            {
                textInput.setFocus();
                textInput.text = rgbToHex(selectedColor);
            }
            return;
        }// end function

        public function set showTextField(param1:Boolean) : void
        {
            _showTextField = param1;
            if (!initializing)
            {
                textInput.visible = param1;
            }
            return;
        }// end function

        override public function set width(param1:Number) : void
        {
            return;
        }// end function

        public function set selectedItem(param1:Object) : void
        {
            var _loc_2:* = NaN;
            if (param1 != selectedItem)
            {
                if (typeof(param1) == "object")
                {
                    _loc_2 = Number(param1[colorField]);
                }
                else if (typeof(param1) == "number")
                {
                    _loc_2 = Number(param1);
                }
                selectedIndex = findColorByName(_loc_2);
            }
            return;
        }// end function

        private function getColor(param1:int) : uint
        {
            if (!dataProvider || dataProvider.length < 1 || param1 < 0 || param1 >= length)
            {
                return StyleManager.NOT_A_COLOR;
            }
            return uint(typeof(dataProvider.getItemAt(param1)) == "object" ? (dataProvider.getItemAt(param1)[colorField]) : (dataProvider.getItemAt(param1)));
        }// end function

        public function set colorField(param1:String) : void
        {
            _colorField = param1;
            return;
        }// end function

        private function setFocusOnSwatch(param1:int) : void
        {
            if (param1 < 0 || param1 > (length - 1))
            {
                highlight.visible = false;
                return;
            }
            var _loc_2:* = Math.floor(param1 / columnCount);
            var _loc_3:* = param1 - _loc_2 * columnCount;
            var _loc_4:* = swatchWidth * _loc_3 + horizontalGap * _loc_3 - cellOffset * _loc_3 + paddingLeft + swatchGridBorderSize;
            var _loc_5:* = swatchHeight * _loc_2 + verticalGap * _loc_2 - cellOffset * _loc_2 + paddingTop + previewHeight + itemOffset + swatchGridBorderSize;
            highlight.move(_loc_4, _loc_5);
            highlight.visible = true;
            isOverGrid = true;
            updateColor(getColor(param1));
            return;
        }// end function

        public function get dataProvider() : Object
        {
            return _dataProvider;
        }// end function

        override public function get width() : Number
        {
            return getExplicitOrMeasuredWidth();
        }// end function

        public function set editable(param1:Boolean) : void
        {
            _editable = param1;
            if (!initializing)
            {
                textInput.editable = param1;
            }
            return;
        }// end function

        override public function styleChanged(param1:String) : void
        {
            if (!initializing)
            {
                refresh();
            }
            return;
        }// end function

        public function set labelField(param1:String) : void
        {
            _labelField = param1;
            return;
        }// end function

        private function swatches_clickHandler(event:MouseEvent) : void
        {
            var _loc_2:* = null;
            if (!enabled)
            {
                return;
            }
            if (mouseX > grid.left && mouseX < grid.right && mouseY > grid.top && mouseY < grid.bottom)
            {
                selectedIndex = focusedIndex;
                if (ColorPicker(owner).selectedIndex != selectedIndex)
                {
                    ColorPicker(owner).selectedIndex = selectedIndex;
                    _loc_2 = new ColorPickerEvent(ColorPickerEvent.CHANGE);
                    _loc_2.index = selectedIndex;
                    _loc_2.color = getColor(selectedIndex);
                    ColorPicker(owner).dispatchEvent(_loc_2);
                }
                ColorPicker(owner).close();
            }
            return;
        }// end function

        private function rgbToHex(param1:uint) : String
        {
            var _loc_2:* = param1.toString(16);
            var _loc_3:* = "00000" + _loc_2;
            var _loc_4:* = _loc_3.length;
            _loc_3 = _loc_3.substring(_loc_4 - 6, _loc_4);
            return _loc_3.toUpperCase();
        }// end function

        private function refresh() : void
        {
            updateStyleCache();
            updateDisplayList(unscaledWidth, unscaledHeight);
            invalidateSize();
            return;
        }// end function

        public function get length() : int
        {
            return _dataProvider ? (_dataProvider.length) : (0);
        }// end function

        public function set selectedIndex(param1:int) : void
        {
            if (param1 != selectedIndex && !initializing)
            {
                focusedIndex = param1;
                _selectedIndex = focusedIndex;
                if (param1 >= 0)
                {
                    indexFlag = true;
                    selectedColor = getColor(param1);
                }
            }
            return;
        }// end function

        override public function drawFocus(param1:Boolean) : void
        {
            return;
        }// end function

        public function get selectedIndex() : int
        {
            return _selectedIndex;
        }// end function

        private function updateStyleCache() : void
        {
            horizontalGap = getStyle("horizontalGap");
            verticalGap = getStyle("verticalGap");
            columnCount = getStyle("columnCount");
            paddingLeft = getStyle("paddingLeft");
            paddingRight = getStyle("paddingRight");
            paddingTop = getStyle("paddingTop");
            paddingBottom = getStyle("paddingBottom");
            textFieldWidth = getStyle("textFieldWidth");
            previewWidth = getStyle("previewWidth");
            previewHeight = getStyle("previewHeight");
            swatchWidth = getStyle("swatchWidth");
            swatchHeight = getStyle("swatchHeight");
            swatchGridBorderSize = getStyle("swatchGridBorderSize");
            if (columnCount > length)
            {
                columnCount = length;
            }
            rows = Math.ceil(length / columnCount);
            return;
        }// end function

        override protected function updateDisplayList(param1:Number, param2:Number) : void
        {
            super.updateDisplayList(param1, param2);
            preview.updateSkin(selectedColor);
            preview.move(paddingLeft, paddingTop);
            textInput.setActualSize(textFieldWidth, previewHeight);
            textInput.move(paddingLeft + previewWidth + itemOffset, paddingTop);
            swatches.updateGrid(IList(dataProvider));
            swatches.move(paddingLeft, paddingTop + previewHeight + itemOffset);
            highlight.updateSkin(0);
            border.setActualSize(param1, param2);
            if (!grid)
            {
                grid = new Rectangle();
            }
            grid.left = swatches.x + swatchGridBorderSize;
            grid.top = swatches.y + swatchGridBorderSize;
            grid.right = swatches.x + swatchGridBorderSize + (swatchWidth - 1) * columnCount + 1 + horizontalGap * (columnCount - 1);
            grid.bottom = swatches.y + swatchGridBorderSize + (swatchHeight - 1) * rows + 1 + verticalGap * (rows - 1);
            return;
        }// end function

    }
}
