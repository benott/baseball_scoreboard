package mx.controls
{
    import flash.display.*;
    import flash.events.*;
    import flash.geom.*;
    import flash.ui.*;
    import mx.controls.colorPickerClasses.*;
    import mx.core.*;
    import mx.effects.*;
    import mx.events.*;
    import mx.managers.*;
    import mx.skins.halo.*;
    import mx.styles.*;

    public class ColorPicker extends ComboBase
    {
        private var dropdownGap:Number = 6;
        private var _selectedColor:uint = 0;
        private var _labelField:String = "label";
        var showingDropdown:Boolean = false;
        private var swatchPreview:SwatchSkin;
        private var dropdownSwatch:SwatchPanel;
        private var isModelInited:Boolean = false;
        private var collectionChanged:Boolean = false;
        private var triggerEvent:Event;
        private var _editable:Boolean = true;
        private var initializing:Boolean = true;
        var isOpening:Boolean = false;
        private var _showTextField:Boolean = true;
        private var indexFlag:Boolean = false;
        var isDown:Boolean = false;
        private var _colorField:String = "color";
        static var createAccessibilityImplementation:Function;
        private static const _swatchStyleFilters:Object = {swatchBorderColor:"swatchBorderColor", swatchBorderSize:"swatchBorderSize"};
        static const VERSION:String = "3.6.0.21751";

        public function ColorPicker()
        {
            if (!isModelInited)
            {
                loadDefaultPalette();
            }
            super.editable = false;
            addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
            return;
        }// end function

        private function loadDefaultPalette() : void
        {
            var _loc_1:* = null;
            if (!dataProvider || dataProvider.length < 1)
            {
                _loc_1 = new WebSafePalette();
                dataProvider = _loc_1.getList();
            }
            selectedIndex = findColorByName(selectedColor);
            return;
        }// end function

        private function dropdownSwatch_itemRollOverHandler(event:ColorPickerEvent) : void
        {
            dispatchEvent(event);
            return;
        }// end function

        function getDropdown() : SwatchPanel
        {
            var _loc_1:* = null;
            if (initializing)
            {
                return null;
            }
            if (!dropdownSwatch)
            {
                dropdownSwatch = new SwatchPanel();
                dropdownSwatch.owner = this;
                dropdownSwatch.editable = editable;
                dropdownSwatch.colorField = colorField;
                dropdownSwatch.labelField = labelField;
                dropdownSwatch.dataProvider = dataProvider;
                dropdownSwatch.showTextField = showTextField;
                dropdownSwatch.selectedColor = selectedColor;
                dropdownSwatch.selectedIndex = selectedIndex;
                _loc_1 = getStyle("swatchPanelStyleName");
                if (_loc_1)
                {
                    dropdownSwatch.styleName = _loc_1;
                }
                else if (FlexVersion.compatibilityVersion < FlexVersion.VERSION_3_0)
                {
                    dropdownSwatch.styleName = this;
                }
                dropdownSwatch.addEventListener(ColorPickerEvent.ITEM_ROLL_OVER, dropdownSwatch_itemRollOverHandler);
                dropdownSwatch.addEventListener(ColorPickerEvent.ITEM_ROLL_OUT, dropdownSwatch_itemRollOutHandler);
                dropdownSwatch.cacheAsBitmap = true;
                dropdownSwatch.scrollRect = new Rectangle(0, 0, 0, 0);
            }
            dropdownSwatch.scaleX = scaleX;
            dropdownSwatch.scaleY = scaleY;
            return dropdownSwatch;
        }// end function

        public function get selectedColor() : uint
        {
            return _selectedColor;
        }// end function

        public function set selectedColor(param1:uint) : void
        {
            if (!indexFlag)
            {
                super.selectedIndex = findColorByName(param1);
            }
            else
            {
                indexFlag = false;
            }
            if (param1 != selectedColor)
            {
                _selectedColor = param1;
                updateColor(param1);
                if (dropdownSwatch)
                {
                    dropdownSwatch.selectedColor = param1;
                }
            }
            dispatchEvent(new FlexEvent(FlexEvent.VALUE_COMMIT));
            return;
        }// end function

        function get dropdown() : SwatchPanel
        {
            return dropdownSwatch;
        }// end function

        override protected function downArrowButton_buttonDownHandler(event:FlexEvent) : void
        {
            displayDropdown(!showingDropdown, event);
            return;
        }// end function

        override protected function createChildren() : void
        {
            super.createChildren();
            if (!swatchPreview)
            {
                swatchPreview = new SwatchSkin();
                swatchPreview.styleName = new StyleProxy(this, swatchStyleFilters);
                swatchPreview.color = selectedColor;
                swatchPreview.name = "colorPickerSwatch";
                if (FlexVersion.compatibilityVersion < FlexVersion.VERSION_3_0)
                {
                    swatchPreview.setStyle("swatchBorderSize", 0);
                }
                addChild(swatchPreview);
            }
            setChildIndex(swatchPreview, getChildIndex(downArrowButton));
            textInput.visible = false;
            if (!enabled)
            {
                super.enabled = enabled;
            }
            initializing = false;
            return;
        }// end function

        override protected function initializeAccessibility() : void
        {
            if (ColorPicker.createAccessibilityImplementation != null)
            {
                ColorPicker.createAccessibilityImplementation(this);
            }
            return;
        }// end function

        public function set showTextField(param1:Boolean) : void
        {
            _showTextField = param1;
            if (dropdownSwatch)
            {
                dropdownSwatch.showTextField = param1;
            }
            return;
        }// end function

        private function updateColor(param1:Number) : void
        {
            if (initializing || isNaN(param1))
            {
                return;
            }
            swatchPreview.updateSkin(param1);
            return;
        }// end function

        override public function set selectedItem(param1:Object) : void
        {
            if (param1 != selectedItem)
            {
                super.selectedItem = param1;
                if (typeof(param1) == "object")
                {
                    selectedColor = Number(param1[colorField]);
                }
                else if (typeof(param1) == "number")
                {
                    selectedColor = Number(param1);
                }
                indexFlag = true;
                if (dropdownSwatch)
                {
                    dropdownSwatch.selectedItem = param1;
                }
            }
            return;
        }// end function

        private function dropdownSwatch_mouseDownOutsideHandler(event:Event) : void
        {
            var _loc_2:* = null;
            if (event is MouseEvent)
            {
                _loc_2 = MouseEvent(event);
                if (!hitTestPoint(_loc_2.stageX, _loc_2.stageY, true))
                {
                    close(event);
                }
            }
            else if (event is SandboxMouseEvent)
            {
                close(event);
            }
            return;
        }// end function

        public function set colorField(param1:String) : void
        {
            _colorField = param1;
            if (dropdownSwatch)
            {
                dropdownSwatch.colorField = param1;
            }
            dispatchEvent(new Event("colorFieldChanged"));
            return;
        }// end function

        private function getColor(param1:int) : Number
        {
            if (!dataProvider || dataProvider.length < 1 || param1 < 0 || param1 >= dataProvider.length)
            {
                return -1;
            }
            return Number(typeof(dataProvider.getItemAt(param1)) == "object" ? (dataProvider.getItemAt(param1)[colorField]) : (dataProvider.getItemAt(param1)));
        }// end function

        private function dropdownSwatch_itemRollOutHandler(event:ColorPickerEvent) : void
        {
            dispatchEvent(event);
            return;
        }// end function

        function onTweenUpdate(param1:Number) : void
        {
            dropdownSwatch.scrollRect = new Rectangle(0, param1, dropdownSwatch.width, dropdownSwatch.height);
            return;
        }// end function

        override public function set editable(param1:Boolean) : void
        {
            _editable = param1;
            if (dropdownSwatch)
            {
                dropdownSwatch.editable = param1;
            }
            dispatchEvent(new Event("editableChanged"));
            return;
        }// end function

        override protected function commitProperties() : void
        {
            super.commitProperties();
            if (collectionChanged)
            {
                if (findColorByName(selectedColor) == -1)
                {
                    if (dataProvider.length > 0 && selectedIndex > dataProvider.length)
                    {
                        selectedIndex = 0;
                    }
                    if (getColor(selectedIndex) >= 0)
                    {
                        selectedColor = getColor(selectedIndex);
                        swatchPreview.color = selectedColor;
                    }
                    else if (dropdownSwatch)
                    {
                        swatchPreview.color = dropdownSwatch.selectedColor;
                    }
                }
                else
                {
                    selectedIndex = findColorByName(selectedColor);
                }
                collectionChanged = false;
            }
            return;
        }// end function

        public function set labelField(param1:String) : void
        {
            _labelField = param1;
            if (dropdownSwatch)
            {
                dropdownSwatch.labelField = param1;
            }
            dispatchEvent(new Event("labelFieldChanged"));
            return;
        }// end function

        public function get showTextField() : Boolean
        {
            return _showTextField;
        }// end function

        override public function styleChanged(param1:String) : void
        {
            var _loc_2:* = null;
            if (dropdownSwatch)
            {
                if (FlexVersion.compatibilityVersion >= FlexVersion.VERSION_3_0)
                {
                    if (param1 == "swatchPanelStyleName")
                    {
                        _loc_2 = getStyle("swatchPanelStyleName");
                        if (_loc_2)
                        {
                            dropdownSwatch.styleName = _loc_2;
                        }
                    }
                }
                dropdownSwatch.styleChanged(param1);
            }
            super.styleChanged(param1);
            invalidateDisplayList();
            return;
        }// end function

        private function findColorByName(param1:Number) : int
        {
            if (param1 == getColor(selectedIndex))
            {
                return selectedIndex;
            }
            var _loc_2:* = dataProvider.length;
            var _loc_3:* = 0;
            while (_loc_3 < dataProvider.length)
            {
                
                if (param1 == getColor(_loc_3))
                {
                    return _loc_3;
                }
                _loc_3++;
            }
            return -1;
        }// end function

        public function get colorField() : String
        {
            return _colorField;
        }// end function

        public function open() : void
        {
            displayDropdown(true);
            return;
        }// end function

        override public function get editable() : Boolean
        {
            return _editable;
        }// end function

        override protected function measure() : void
        {
            var _loc_1:* = DEFAULT_MEASURED_MIN_HEIGHT;
            measuredWidth = DEFAULT_MEASURED_MIN_HEIGHT;
            measuredMinWidth = _loc_1;
            var _loc_1:* = DEFAULT_MEASURED_MIN_HEIGHT;
            measuredHeight = DEFAULT_MEASURED_MIN_HEIGHT;
            measuredMinHeight = _loc_1;
            return;
        }// end function

        public function get labelField() : String
        {
            return _labelField;
        }// end function

        override protected function keyDownHandler(event:KeyboardEvent) : void
        {
            var _loc_2:* = null;
            if (event.ctrlKey && event.keyCode == Keyboard.DOWN)
            {
                displayDropdown(true, event);
            }
            else if (event.ctrlKey && event.keyCode == Keyboard.UP || event.keyCode == Keyboard.ESCAPE)
            {
                if (dropdownSwatch && dropdownSwatch.enabled)
                {
                    close(event);
                }
            }
            else if (showingDropdown && event.keyCode == Keyboard.ENTER && dropdownSwatch.enabled)
            {
                if (!dropdownSwatch.isOverGrid && editable)
                {
                    if (selectedColor != dropdownSwatch.selectedColor)
                    {
                        selectedColor = dropdownSwatch.selectedColor;
                        _loc_2 = new ColorPickerEvent(ColorPickerEvent.CHANGE);
                        _loc_2.index = selectedIndex;
                        _loc_2.color = selectedColor;
                        dispatchEvent(_loc_2);
                        _loc_2 = new ColorPickerEvent(ColorPickerEvent.ENTER);
                        _loc_2.color = selectedColor;
                        dispatchEvent(_loc_2);
                    }
                }
                else if (selectedIndex != dropdownSwatch.focusedIndex)
                {
                    dropdownSwatch.selectedIndex = dropdownSwatch.focusedIndex;
                    selectedIndex = dropdownSwatch.selectedIndex;
                    _loc_2 = new ColorPickerEvent(ColorPickerEvent.CHANGE);
                    _loc_2.index = selectedIndex;
                    _loc_2.color = selectedColor;
                    dispatchEvent(_loc_2);
                }
                close();
                event.stopPropagation();
            }
            else if (showingDropdown && (event.keyCode == Keyboard.HOME || event.keyCode == Keyboard.END || event.keyCode == Keyboard.PAGE_UP || event.keyCode == Keyboard.PAGE_DOWN || event.keyCode == Keyboard.LEFT || event.keyCode == Keyboard.RIGHT || event.keyCode == Keyboard.UP || event.keyCode == Keyboard.DOWN))
            {
                dropdownSwatch.dispatchEvent(event);
            }
            else if (event.keyCode == Keyboard.LEFT)
            {
                if (selectedIndex == -1)
                {
                    selectedIndex = findColorByName(selectedColor);
                }
                if ((selectedIndex - 1) >= 0)
                {
                    var _loc_4:* = selectedIndex - 1;
                    selectedIndex = _loc_4;
                    _loc_2 = new ColorPickerEvent(ColorPickerEvent.CHANGE);
                    _loc_2.index = selectedIndex;
                    _loc_2.color = selectedColor;
                    dispatchEvent(_loc_2);
                }
            }
            else if (event.keyCode == Keyboard.RIGHT)
            {
                if (selectedIndex == -1)
                {
                    selectedIndex = findColorByName(selectedColor);
                }
                if ((selectedIndex + 1) < dataProvider.length)
                {
                    var _loc_4:* = selectedIndex + 1;
                    selectedIndex = _loc_4;
                    _loc_2 = new ColorPickerEvent(ColorPickerEvent.CHANGE);
                    _loc_2.index = selectedIndex;
                    _loc_2.color = selectedColor;
                    dispatchEvent(_loc_2);
                }
            }
            return;
        }// end function

        protected function get swatchStyleFilters() : Object
        {
            return _swatchStyleFilters;
        }// end function

        override public function set selectedIndex(param1:int) : void
        {
            if ((selectedIndex != -1 || !isNaN(selectedColor)) && param1 != selectedIndex)
            {
                if (param1 >= 0)
                {
                    indexFlag = true;
                    selectedColor = getColor(param1);
                    super.selectedIndex = param1;
                }
                if (dropdownSwatch)
                {
                    dropdownSwatch.selectedIndex = param1;
                }
            }
            return;
        }// end function

        function onTweenEnd(param1:Number) : void
        {
            if (showingDropdown)
            {
                dropdownSwatch.scrollRect = null;
            }
            else
            {
                onTweenUpdate(param1);
                dropdownSwatch.visible = false;
                isOpening = false;
            }
            UIComponent.resumeBackgroundProcessing();
            if (showingDropdown && showTextField)
            {
                dropdownSwatch.setFocus();
            }
            else
            {
                setFocus();
            }
            dropdownSwatch.enabled = true;
            dispatchEvent(new DropdownEvent(showingDropdown ? (DropdownEvent.OPEN) : (DropdownEvent.CLOSE), false, false, triggerEvent));
            return;
        }// end function

        override protected function focusInHandler(event:FocusEvent) : void
        {
            var _loc_2:* = focusManager;
            if (_loc_2)
            {
                _loc_2.showFocusIndicator = true;
            }
            if (isDown && !isOpening)
            {
                close();
            }
            else if (isOpening)
            {
                isOpening = false;
            }
            super.focusInHandler(event);
            return;
        }// end function

        override protected function updateDisplayList(param1:Number, param2:Number) : void
        {
            super.updateDisplayList(param1, param2);
            swatchPreview.color = selectedColor;
            swatchPreview.setActualSize(param1, param2);
            downArrowButton.move(0, 0);
            downArrowButton.setActualSize(param1, param2);
            if (dropdownSwatch)
            {
                dropdownSwatch.setActualSize(dropdownSwatch.getExplicitOrMeasuredWidth(), dropdownSwatch.getExplicitOrMeasuredHeight());
            }
            return;
        }// end function

        public function close(event:Event = null) : void
        {
            displayDropdown(false, event);
            return;
        }// end function

        function displayDropdown(param1:Boolean, param2:Event = null) : void
        {
            var _loc_4:* = NaN;
            var _loc_5:* = NaN;
            var _loc_7:* = null;
            var _loc_8:* = NaN;
            var _loc_9:* = null;
            var _loc_10:* = null;
            var _loc_11:* = null;
            var _loc_12:* = null;
            if (param1 == showingDropdown)
            {
                return;
            }
            var _loc_3:* = new Point(0, 0);
            _loc_3 = localToGlobal(_loc_3);
            var _loc_6:* = null;
            triggerEvent = param2;
            if (param1)
            {
                getDropdown();
                if (dropdownSwatch.parent == null)
                {
                    PopUpManager.addPopUp(dropdownSwatch, parent, false);
                }
                else
                {
                    PopUpManager.bringToFront(dropdownSwatch);
                }
                dropdownSwatch.addEventListener(FlexMouseEvent.MOUSE_DOWN_OUTSIDE, dropdownSwatch_mouseDownOutsideHandler);
                dropdownSwatch.addEventListener(FlexMouseEvent.MOUSE_WHEEL_OUTSIDE, dropdownSwatch_mouseDownOutsideHandler);
                dropdownSwatch.addEventListener(SandboxMouseEvent.MOUSE_DOWN_SOMEWHERE, dropdownSwatch_mouseDownOutsideHandler);
                dropdownSwatch.addEventListener(SandboxMouseEvent.MOUSE_WHEEL_SOMEWHERE, dropdownSwatch_mouseDownOutsideHandler);
                dropdownSwatch.isOpening = true;
                dropdownSwatch.showTextField = showTextField;
                dropdownSwatch.selectedColor = selectedColor;
                dropdownSwatch.owner = this;
                _loc_9 = systemManager.topLevelSystemManager;
                _loc_10 = _loc_9.getSandboxRoot();
                if (_loc_9 != _loc_10)
                {
                    _loc_12 = new InterManagerRequest(InterManagerRequest.SYSTEM_MANAGER_REQUEST, false, false, "getVisibleApplicationRect");
                    _loc_10.dispatchEvent(_loc_12);
                    _loc_11 = Rectangle(_loc_12.value);
                }
                else
                {
                    _loc_11 = _loc_9.getVisibleApplicationRect();
                }
                if (_loc_3.y + height + dropdownGap + dropdownSwatch.height > _loc_11.bottom && _loc_3.y > _loc_11.top + dropdownGap + dropdownSwatch.height)
                {
                    _loc_3.y = _loc_3.y - (dropdownGap + dropdownSwatch.height);
                    _loc_4 = (-dropdownSwatch.height) / scaleY;
                    dropdownSwatch.tweenUp = true;
                }
                else
                {
                    _loc_3.y = _loc_3.y + (dropdownGap + height);
                    _loc_4 = dropdownSwatch.height / scaleY;
                    dropdownSwatch.tweenUp = false;
                }
                if (_loc_3.x + dropdownSwatch.width > _loc_11.right && _loc_3.x > _loc_11.left + dropdownSwatch.width)
                {
                    _loc_3.x = _loc_3.x - (dropdownSwatch.width - width);
                }
                _loc_3 = dropdownSwatch.parent.globalToLocal(_loc_3);
                dropdownSwatch.move(_loc_3.x, _loc_3.y);
                isDown = true;
                isOpening = true;
                _loc_5 = 0;
                _loc_8 = getStyle("openDuration");
                _loc_7 = getStyle("openEasingFunction") as Function;
                showingDropdown = param1;
            }
            else
            {
                _loc_4 = 0;
                _loc_5 = dropdownSwatch.tweenUp ? ((-dropdownSwatch.height) / scaleY) : (dropdownSwatch.height / scaleY);
                isDown = false;
                _loc_8 = getStyle("closeDuration");
                _loc_7 = getStyle("closeEasingFunction") as Function;
                showingDropdown = param1;
                dropdownSwatch.removeEventListener(FlexMouseEvent.MOUSE_DOWN_OUTSIDE, dropdownSwatch_mouseDownOutsideHandler);
                dropdownSwatch.removeEventListener(FlexMouseEvent.MOUSE_WHEEL_OUTSIDE, dropdownSwatch_mouseDownOutsideHandler);
                dropdownSwatch.removeEventListener(SandboxMouseEvent.MOUSE_DOWN_SOMEWHERE, dropdownSwatch_mouseDownOutsideHandler);
                dropdownSwatch.removeEventListener(SandboxMouseEvent.MOUSE_WHEEL_SOMEWHERE, dropdownSwatch_mouseDownOutsideHandler);
                PopUpManager.removePopUp(dropdownSwatch);
            }
            if (dropdownSwatch)
            {
                dropdownSwatch.visible = true;
                dropdownSwatch.enabled = false;
            }
            UIComponentGlobals.layoutManager.validateNow();
            UIComponent.suspendBackgroundProcessing();
            _loc_6 = new Tween(this, _loc_4, _loc_5, _loc_8);
            if (_loc_7 != null)
            {
                _loc_6.easingFunction = _loc_7;
            }
            return;
        }// end function

        override protected function collectionChangeHandler(event:Event) : void
        {
            if (!initializing)
            {
                if (dataProvider.length > 0)
                {
                    invalidateProperties();
                }
                else
                {
                    selectedColor = 0;
                    selectedIndex = -1;
                }
                collectionChanged = true;
            }
            if (dropdownSwatch)
            {
                dropdownSwatch.dataProvider = dataProvider;
            }
            return;
        }// end function

        override public function set dataProvider(param1:Object) : void
        {
            super.dataProvider = param1;
            isModelInited = true;
            if (dropdownSwatch)
            {
                dropdownSwatch.dataProvider = param1;
            }
            return;
        }// end function

    }
}
