package mx.flash
{
    import flash.display.*;
    import flash.events.*;
    import flash.geom.*;
    import flash.system.*;
    import flash.ui.*;
    import mx.automation.*;
    import mx.core.*;
    import mx.events.*;
    import mx.managers.*;

    dynamic public class UIMovieClip extends MovieClip implements IDeferredInstantiationUIComponent, IToolTipManagerClient, IStateClient, IFocusManagerComponent, IConstraintClient, IAutomationObject
    {
        private var reverseDirectionFocus:Boolean = false;
        private var oldHeight:Number;
        protected var _height:Number;
        private var _automationName:String = null;
        private var _automationDelegate:IAutomationObject;
        private var _currentState:String;
        private var _document:Object;
        private var _systemManager:ISystemManager;
        private var _isPopUp:Boolean = false;
        private var focusableObjects:Array;
        private var _top:Object;
        private var _percentWidth:Number;
        private var _explicitHeight:Number;
        private var explicitSizeChanged:Boolean = false;
        private var _measuredWidth:Number;
        private var _toolTip:String;
        public var boundingBoxName:String = "boundingBox";
        protected var _width:Number;
        private var _tweeningProperties:Array;
        protected var initialized:Boolean = false;
        private var _focusPane:Sprite;
        private var _left:Object;
        private var transitionEndState:String;
        private var focusListenersAdded:Boolean = false;
        private var stateMap:Object;
        private var _showInAutomationHierarchy:Boolean = true;
        private var _descriptor:UIComponentDescriptor;
        private var oldX:Number;
        private var oldY:Number;
        private var _right:Object;
        private var validateMeasuredSizeFlag:Boolean = true;
        protected var trackSizeChanges:Boolean = true;
        private var _includeInLayout:Boolean = true;
        private var _focusEnabled:Boolean = true;
        private var _explicitMinWidth:Number;
        private var _bottom:Object;
        private var _explicitMaxHeight:Number;
        private var explicitTabEnabledChanged:Boolean = false;
        private var transitionStartFrame:Number;
        private var _explicitMaxWidth:Number;
        private var _measuredMinHeight:Number = 0;
        private var _verticalCenter:Object;
        private var _baseline:Object;
        private var transitionDirection:Number = 0;
        private var _measuredHeight:Number;
        private var _owner:DisplayObjectContainer;
        private var _id:String;
        private var transitionEndFrame:Number;
        private var _explicitMinHeight:Number;
        private var _parent:DisplayObjectContainer;
        private var _percentHeight:Number;
        private var _measuredMinWidth:Number = 0;
        private var oldWidth:Number;
        private var _explicitWidth:Number;
        private var _horizontalCenter:Object;

        public function UIMovieClip()
        {
            focusableObjects = [];
            addEventListener(Event.ENTER_FRAME, enterFrameHandler, false, 0, true);
            addEventListener(FocusEvent.FOCUS_IN, focusInHandler, false, 0, true);
            addEventListener(FlexEvent.CREATION_COMPLETE, creationCompleteHandler);
            return;
        }// end function

        override public function get tabEnabled() : Boolean
        {
            return super.tabEnabled;
        }// end function

        public function get left()
        {
            return _left;
        }// end function

        public function set left(param1) : void
        {
            var _loc_2:* = this.left;
            if (_loc_2 !== param1)
            {
                this._3317767left = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "left", _loc_2, param1));
            }
            return;
        }// end function

        public function get automationDelegate() : Object
        {
            return _automationDelegate;
        }// end function

        public function get minHeight() : Number
        {
            if (!isNaN(explicitMinHeight))
            {
                return explicitMinHeight;
            }
            return measuredMinHeight;
        }// end function

        public function getExplicitOrMeasuredHeight() : Number
        {
            var _loc_1:* = NaN;
            if (isNaN(explicitHeight))
            {
                _loc_1 = measuredHeight;
                if (!isNaN(explicitMinHeight) && _loc_1 < explicitMinHeight)
                {
                    _loc_1 = explicitMinHeight;
                }
                if (!isNaN(explicitMaxHeight) && _loc_1 > explicitMaxHeight)
                {
                    _loc_1 = explicitMaxHeight;
                }
                return _loc_1;
            }
            return explicitHeight;
        }// end function

        public function get right()
        {
            return _right;
        }// end function

        private function validateMeasuredSize() : void
        {
            if (validateMeasuredSizeFlag)
            {
                validateMeasuredSizeFlag = false;
                _measuredWidth = bounds.width;
                _measuredHeight = bounds.height;
            }
            return;
        }// end function

        public function get bottom()
        {
            return _bottom;
        }// end function

        public function set explicitMaxWidth(param1:Number) : void
        {
            _explicitMaxWidth = param1;
            return;
        }// end function

        protected function enterFrameHandler(event:Event) : void
        {
            var _loc_2:* = null;
            var _loc_3:* = NaN;
            if (explicitSizeChanged)
            {
                explicitSizeChanged = false;
                setActualSize(getExplicitOrMeasuredWidth(), getExplicitOrMeasuredHeight());
            }
            if (isNaN(oldX))
            {
                oldX = x;
            }
            if (isNaN(oldY))
            {
                oldY = y;
            }
            if (x != oldX || y != oldY)
            {
                dispatchMoveEvent();
            }
            if (trackSizeChanges)
            {
                _loc_2 = bounds;
                _loc_2.width = _loc_2.width * scaleX;
                _loc_2.height = _loc_2.height * scaleY;
                if (isNaN(oldWidth))
                {
                    var _loc_4:* = _loc_2.width;
                    _width = _loc_2.width;
                    oldWidth = _loc_4;
                }
                if (isNaN(oldHeight))
                {
                    var _loc_4:* = _loc_2.height;
                    _height = _loc_2.height;
                    oldHeight = _loc_4;
                }
                if (sizeChanged(_loc_2.width, oldWidth) || sizeChanged(_loc_2.height, oldHeight))
                {
                    _width = _loc_2.width;
                    _height = _loc_2.height;
                    validateMeasuredSizeFlag = true;
                    notifySizeChanged();
                    dispatchResizeEvent();
                }
                else if (sizeChanged(width, oldWidth) || sizeChanged(height, oldHeight))
                {
                    dispatchResizeEvent();
                }
            }
            if (currentLabel && currentLabel.indexOf(":") < 0 && currentLabel != _currentState)
            {
                _currentState = currentLabel;
            }
            if (transitionDirection != 0)
            {
                _loc_3 = currentFrame + transitionDirection;
                if (transitionDirection > 0 && _loc_3 >= transitionEndFrame || transitionDirection < 0 && _loc_3 <= transitionEndFrame)
                {
                    gotoAndStop(stateMap[transitionEndState].frame);
                    transitionDirection = 0;
                }
                else
                {
                    gotoAndStop(_loc_3);
                }
            }
            return;
        }// end function

        public function get tweeningProperties() : Array
        {
            return _tweeningProperties;
        }// end function

        public function set minHeight(param1:Number) : void
        {
            explicitMinHeight = param1;
            return;
        }// end function

        public function set right(param1) : void
        {
            var _loc_2:* = this.right;
            if (_loc_2 !== param1)
            {
                this._108511772right = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "right", _loc_2, param1));
            }
            return;
        }// end function

        private function keyFocusChangeHandler(event:FocusEvent) : void
        {
            if (event.keyCode == Keyboard.TAB)
            {
                if (stage.focus == focusableObjects[event.shiftKey ? (0) : ((focusableObjects.length - 1))])
                {
                    removeFocusEventListeners();
                }
                else
                {
                    event.stopImmediatePropagation();
                }
            }
            return;
        }// end function

        public function get baseline()
        {
            return _baseline;
        }// end function

        private function set _1383228885bottom(param1) : void
        {
            if (param1 != _bottom)
            {
                _bottom = param1;
                notifySizeChanged();
            }
            return;
        }// end function

        public function get automationName() : String
        {
            if (_automationName)
            {
                return _automationName;
            }
            if (automationDelegate)
            {
                return automationDelegate.automationName;
            }
            return "";
        }// end function

        public function get explicitMinHeight() : Number
        {
            return _explicitMinHeight;
        }// end function

        private function keyFocusChangeCaptureHandler(event:FocusEvent) : void
        {
            reverseDirectionFocus = event.shiftKey;
            return;
        }// end function

        public function set bottom(param1) : void
        {
            var _loc_2:* = this.bottom;
            if (_loc_2 !== param1)
            {
                this._1383228885bottom = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bottom", _loc_2, param1));
            }
            return;
        }// end function

        public function set id(param1:String) : void
        {
            _id = param1;
            return;
        }// end function

        public function set tweeningProperties(param1:Array) : void
        {
            _tweeningProperties = param1;
            return;
        }// end function

        public function get focusPane() : Sprite
        {
            return _focusPane;
        }// end function

        override public function set height(param1:Number) : void
        {
            explicitHeight = param1;
            return;
        }// end function

        protected function notifySizeChanged() : void
        {
            if (parent && parent is IInvalidating)
            {
                IInvalidating(parent).invalidateSize();
                IInvalidating(parent).invalidateDisplayList();
            }
            return;
        }// end function

        public function get numAutomationChildren() : int
        {
            if (automationDelegate)
            {
                return automationDelegate.numAutomationChildren;
            }
            return 0;
        }// end function

        protected function focusInHandler(event:FocusEvent) : void
        {
            if (!focusListenersAdded)
            {
                addFocusEventListeners();
            }
            return;
        }// end function

        public function set document(param1:Object) : void
        {
            _document = param1;
            return;
        }// end function

        public function getExplicitOrMeasuredWidth() : Number
        {
            var _loc_1:* = NaN;
            if (isNaN(explicitWidth))
            {
                _loc_1 = measuredWidth;
                if (!isNaN(explicitMinWidth) && _loc_1 < explicitMinWidth)
                {
                    _loc_1 = explicitMinWidth;
                }
                if (!isNaN(explicitMaxWidth) && _loc_1 > explicitMaxWidth)
                {
                    _loc_1 = explicitMaxWidth;
                }
                return _loc_1;
            }
            return explicitWidth;
        }// end function

        private function set _3317767left(param1) : void
        {
            if (param1 != _left)
            {
                _left = param1;
                notifySizeChanged();
            }
            return;
        }// end function

        public function get explicitHeight() : Number
        {
            return _explicitHeight;
        }// end function

        public function get showInAutomationHierarchy() : Boolean
        {
            return _showInAutomationHierarchy;
        }// end function

        public function get systemManager() : ISystemManager
        {
            var _loc_1:* = null;
            var _loc_2:* = null;
            var _loc_3:* = null;
            if (!_systemManager)
            {
                _loc_1 = root;
                if (_loc_1)
                {
                    _systemManager = _loc_1 as ISystemManager;
                }
                else
                {
                    _loc_2 = parent;
                    while (_loc_2)
                    {
                        
                        _loc_3 = _loc_2 as IUIComponent;
                        if (_loc_3)
                        {
                            _systemManager = _loc_3.systemManager;
                            break;
                        }
                        _loc_2 = _loc_2.parent;
                    }
                }
            }
            return _systemManager;
        }// end function

        public function get percentWidth() : Number
        {
            return _percentWidth;
        }// end function

        public function set automationName(param1:String) : void
        {
            _automationName = param1;
            return;
        }// end function

        public function set explicitMinHeight(param1:Number) : void
        {
            _explicitMinHeight = param1;
            notifySizeChanged();
            return;
        }// end function

        public function get baselinePosition() : Number
        {
            return 0;
        }// end function

        public function set focusEnabled(param1:Boolean) : void
        {
            _focusEnabled = param1;
            return;
        }// end function

        public function get currentState() : String
        {
            return _currentState;
        }// end function

        public function get minWidth() : Number
        {
            if (!isNaN(explicitMinWidth))
            {
                return explicitMinWidth;
            }
            return measuredMinWidth;
        }// end function

        public function get measuredWidth() : Number
        {
            validateMeasuredSize();
            return _measuredWidth;
        }// end function

        public function get mouseFocusEnabled() : Boolean
        {
            return false;
        }// end function

        public function get automationValue() : Array
        {
            if (automationDelegate)
            {
                return automationDelegate.automationValue;
            }
            return [];
        }// end function

        private function set _115029top(param1) : void
        {
            if (param1 != _top)
            {
                _top = param1;
                notifySizeChanged();
            }
            return;
        }// end function

        override public function get parent() : DisplayObjectContainer
        {
            return _parent ? (_parent) : (super.parent);
        }// end function

        public function get owner() : DisplayObjectContainer
        {
            return _owner ? (_owner) : (parent);
        }// end function

        protected function get bounds() : Rectangle
        {
            if (boundingBoxName && boundingBoxName != "" && boundingBoxName in this && this[boundingBoxName])
            {
                return this[boundingBoxName].getBounds(this);
            }
            return getBounds(this);
        }// end function

        public function set baseline(param1) : void
        {
            var _loc_2:* = this.baseline;
            if (_loc_2 !== param1)
            {
                this._1720785339baseline = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "baseline", _loc_2, param1));
            }
            return;
        }// end function

        public function setActualSize(param1:Number, param2:Number) : void
        {
            if (sizeChanged(_width, param1) || sizeChanged(_height, param2))
            {
                dispatchResizeEvent();
            }
            _width = param1;
            _height = param2;
            super.scaleX = param1 / measuredWidth;
            super.scaleY = param2 / measuredHeight;
            return;
        }// end function

        public function parentChanged(param1:DisplayObjectContainer) : void
        {
            if (!param1)
            {
                _parent = null;
            }
            else if (param1 is IUIComponent || param1 is ISystemManager)
            {
                _parent = param1;
            }
            else
            {
                _parent = param1.parent;
            }
            return;
        }// end function

        public function get maxWidth() : Number
        {
            return isNaN(explicitMaxWidth) ? (10000) : (explicitMaxWidth);
        }// end function

        public function createAutomationIDPart(param1:IAutomationObject) : Object
        {
            if (automationDelegate)
            {
                return automationDelegate.createAutomationIDPart(param1);
            }
            return null;
        }// end function

        public function getAutomationChildAt(param1:int) : IAutomationObject
        {
            if (automationDelegate)
            {
                return automationDelegate.getAutomationChildAt(param1);
            }
            return null;
        }// end function

        private function removeFocusEventListeners() : void
        {
            stage.removeEventListener(FocusEvent.KEY_FOCUS_CHANGE, keyFocusChangeHandler);
            stage.removeEventListener(FocusEvent.FOCUS_OUT, focusOutHandler);
            focusListenersAdded = false;
            return;
        }// end function

        public function set focusPane(param1:Sprite) : void
        {
            _focusPane = param1;
            return;
        }// end function

        public function setConstraintValue(param1:String, param2) : void
        {
            this[param1] = param2;
            return;
        }// end function

        public function set verticalCenter(param1) : void
        {
            var _loc_2:* = this.verticalCenter;
            if (_loc_2 !== param1)
            {
                this._926273685verticalCenter = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "verticalCenter", _loc_2, param1));
            }
            return;
        }// end function

        public function set top(param1) : void
        {
            var _loc_2:* = this.top;
            if (_loc_2 !== param1)
            {
                this._115029top = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "top", _loc_2, param1));
            }
            return;
        }// end function

        public function set descriptor(param1:UIComponentDescriptor) : void
        {
            _descriptor = param1;
            return;
        }// end function

        public function set includeInLayout(param1:Boolean) : void
        {
            _includeInLayout = param1;
            return;
        }// end function

        public function get explicitMinWidth() : Number
        {
            return _explicitMinWidth;
        }// end function

        override public function set visible(param1:Boolean) : void
        {
            setVisible(param1);
            return;
        }// end function

        public function registerEffects(param1:Array) : void
        {
            return;
        }// end function

        public function set showInAutomationHierarchy(param1:Boolean) : void
        {
            _showInAutomationHierarchy = param1;
            return;
        }// end function

        public function set measuredMinWidth(param1:Number) : void
        {
            _measuredMinWidth = param1;
            return;
        }// end function

        public function set explicitHeight(param1:Number) : void
        {
            _explicitHeight = param1;
            explicitSizeChanged = true;
            notifySizeChanged();
            return;
        }// end function

        private function creationCompleteHandler(event:Event) : void
        {
            removeEventListener(FlexEvent.CREATION_COMPLETE, creationCompleteHandler);
            if (systemManager)
            {
                systemManager.stage.addEventListener(FocusEvent.KEY_FOCUS_CHANGE, keyFocusChangeCaptureHandler, true, 0, true);
            }
            else if (parentDocument && parentDocument.systemManager)
            {
                parentDocument.systemManager.stage.addEventListener(FocusEvent.KEY_FOCUS_CHANGE, keyFocusChangeCaptureHandler, true, 0, true);
            }
            return;
        }// end function

        public function set percentWidth(param1:Number) : void
        {
            _percentWidth = param1;
            notifySizeChanged();
            return;
        }// end function

        private function set _926273685verticalCenter(param1) : void
        {
            if (param1 != _verticalCenter)
            {
                _verticalCenter = param1;
                notifySizeChanged();
            }
            return;
        }// end function

        public function get explicitMaxWidth() : Number
        {
            return _explicitMaxWidth;
        }// end function

        public function set systemManager(param1:ISystemManager) : void
        {
            _systemManager = param1;
            return;
        }// end function

        public function get document() : Object
        {
            return _document;
        }// end function

        public function executeBindings(param1:Boolean = false) : void
        {
            var _loc_2:* = descriptor && descriptor.document ? (descriptor.document) : (parentDocument);
            var _loc_3:* = ApplicationDomain.currentDomain.getDefinition("mx.binding.BindingManager");
            if (_loc_3 != null)
            {
                _loc_3.executeBindings(_loc_2, id, this);
            }
            return;
        }// end function

        override public function get height() : Number
        {
            if (!isNaN(_height))
            {
                return _height;
            }
            return super.height;
        }// end function

        public function set minWidth(param1:Number) : void
        {
            explicitMinWidth = param1;
            return;
        }// end function

        public function set currentState(param1:String) : void
        {
            var _loc_2:* = null;
            var _loc_3:* = NaN;
            var _loc_4:* = NaN;
            var _loc_5:* = null;
            if (param1 == _currentState)
            {
                return;
            }
            if (!stateMap)
            {
                buildStateMap();
            }
            if (stateMap[param1])
            {
                _loc_2 = _currentState + "-" + param1 + ":start";
                if (stateMap[_loc_2])
                {
                    _loc_3 = stateMap[_loc_2].frame;
                    _loc_4 = stateMap[_currentState + "-" + param1 + ":end"].frame;
                }
                if (isNaN(_loc_3))
                {
                    _loc_2 = param1 + "-" + _currentState + ":end";
                    if (stateMap[_loc_2])
                    {
                        _loc_3 = stateMap[_loc_2].frame;
                        _loc_4 = stateMap[param1 + "-" + _currentState + ":start"].frame;
                    }
                }
                if (isNaN(_loc_3))
                {
                    _loc_2 = "*-" + param1 + ":start";
                    if (stateMap[_loc_2])
                    {
                        _loc_3 = stateMap[_loc_2].frame;
                        _loc_4 = stateMap["*-" + param1 + ":end"].frame;
                    }
                }
                if (isNaN(_loc_3))
                {
                    _loc_2 = param1 + "-*:end";
                    if (stateMap[_loc_2])
                    {
                        _loc_3 = stateMap[_loc_2].frame;
                        _loc_4 = stateMap[param1 + "-*:start"].frame;
                    }
                }
                if (isNaN(_loc_3))
                {
                    _loc_2 = _currentState + "-*:start";
                    if (stateMap[_loc_2])
                    {
                        _loc_3 = stateMap[_loc_2].frame;
                        _loc_4 = stateMap[_currentState + "-*:end"].frame;
                    }
                }
                if (isNaN(_loc_3))
                {
                    _loc_2 = "*-" + _currentState + ":end";
                    if (stateMap[_loc_2])
                    {
                        _loc_3 = stateMap[_loc_2].frame;
                        _loc_4 = stateMap["*-" + _currentState + ":start"].frame;
                    }
                }
                if (isNaN(_loc_3))
                {
                    _loc_2 = "*-*:start";
                    if (stateMap[_loc_2])
                    {
                        _loc_3 = stateMap[_loc_2].frame;
                        _loc_4 = stateMap["*-*:end"].frame;
                    }
                }
                if (isNaN(_loc_3) && param1 in stateMap)
                {
                    _loc_3 = stateMap[param1].frame;
                }
                if (isNaN(_loc_3))
                {
                    return;
                }
                _loc_5 = new StateChangeEvent(StateChangeEvent.CURRENT_STATE_CHANGING);
                _loc_5.oldState = _currentState;
                _loc_5.newState = param1;
                dispatchEvent(_loc_5);
                if (isNaN(_loc_4))
                {
                    gotoAndStop(_loc_3);
                    transitionDirection = 0;
                }
                else
                {
                    if (currentFrame < Math.min(_loc_3, _loc_4) || currentFrame > Math.max(_loc_3, _loc_4))
                    {
                        gotoAndStop(_loc_3);
                    }
                    else
                    {
                        _loc_3 = currentFrame;
                    }
                    transitionStartFrame = _loc_3;
                    transitionEndFrame = _loc_4;
                    transitionDirection = _loc_4 > _loc_3 ? (1) : (-1);
                    transitionEndState = param1;
                }
                _loc_5 = new StateChangeEvent(StateChangeEvent.CURRENT_STATE_CHANGE);
                _loc_5.oldState = _currentState;
                _loc_5.newState = param1;
                dispatchEvent(_loc_5);
                _currentState = param1;
            }
            return;
        }// end function

        public function get id() : String
        {
            return _id;
        }// end function

        private function focusOutHandler(event:FocusEvent) : void
        {
            if (focusableObjects.indexOf(event.relatedObject) == -1)
            {
                removeFocusEventListeners();
            }
            return;
        }// end function

        public function replayAutomatableEvent(event:Event) : Boolean
        {
            if (automationDelegate)
            {
                return automationDelegate.replayAutomatableEvent(event);
            }
            return false;
        }// end function

        public function get focusEnabled() : Boolean
        {
            return _focusEnabled && focusableObjects.length > 0;
        }// end function

        public function set cacheHeuristic(param1:Boolean) : void
        {
            return;
        }// end function

        private function set _108511772right(param1) : void
        {
            if (param1 != _right)
            {
                _right = param1;
                notifySizeChanged();
            }
            return;
        }// end function

        public function get top()
        {
            return _top;
        }// end function

        public function set maxHeight(param1:Number) : void
        {
            explicitMaxHeight = param1;
            return;
        }// end function

        private function set _1720785339baseline(param1) : void
        {
            if (param1 != _baseline)
            {
                _baseline = param1;
                notifySizeChanged();
            }
            return;
        }// end function

        private function addFocusEventListeners() : void
        {
            stage.addEventListener(FocusEvent.KEY_FOCUS_CHANGE, keyFocusChangeHandler, false, 1, true);
            stage.addEventListener(FocusEvent.FOCUS_OUT, focusOutHandler, false, 0, true);
            focusListenersAdded = true;
            return;
        }// end function

        public function get cachePolicy() : String
        {
            return "";
        }// end function

        public function getConstraintValue(param1:String)
        {
            return this[param1];
        }// end function

        public function set owner(param1:DisplayObjectContainer) : void
        {
            _owner = param1;
            return;
        }// end function

        protected function findFocusCandidates(param1:DisplayObjectContainer) : void
        {
            var _loc_3:* = null;
            var _loc_2:* = 0;
            while (_loc_2 < param1.numChildren)
            {
                
                _loc_3 = param1.getChildAt(_loc_2) as InteractiveObject;
                if (_loc_3 && _loc_3.tabEnabled)
                {
                    focusableObjects.push(_loc_3);
                    if (!explicitTabEnabledChanged)
                    {
                        tabEnabled = true;
                    }
                }
                if (_loc_3 is DisplayObjectContainer)
                {
                    findFocusCandidates(DisplayObjectContainer(_loc_3));
                }
                _loc_2++;
            }
            return;
        }// end function

        public function get verticalCenter()
        {
            return _verticalCenter;
        }// end function

        private function set _2016110183horizontalCenter(param1) : void
        {
            if (param1 != _horizontalCenter)
            {
                _horizontalCenter = param1;
                notifySizeChanged();
            }
            return;
        }// end function

        public function get descriptor() : UIComponentDescriptor
        {
            return _descriptor;
        }// end function

        public function createReferenceOnParentDocument(param1:IFlexDisplayObject) : void
        {
            if (id && id != "")
            {
                param1[id] = this;
            }
            return;
        }// end function

        public function get includeInLayout() : Boolean
        {
            return _includeInLayout;
        }// end function

        public function set automationDelegate(param1:Object) : void
        {
            _automationDelegate = param1 as IAutomationObject;
            return;
        }// end function

        public function get measuredMinWidth() : Number
        {
            return _measuredMinWidth;
        }// end function

        public function set isPopUp(param1:Boolean) : void
        {
            _isPopUp = param1;
            return;
        }// end function

        public function get measuredHeight() : Number
        {
            validateMeasuredSize();
            return _measuredHeight;
        }// end function

        public function initialize() : void
        {
            var _loc_2:* = null;
            initialized = true;
            dispatchEvent(new FlexEvent(FlexEvent.PREINITIALIZE));
            if (boundingBoxName && boundingBoxName != "" && boundingBoxName in this && this[boundingBoxName])
            {
                this[boundingBoxName].visible = false;
            }
            if (explicitSizeChanged)
            {
                explicitSizeChanged = false;
                setActualSize(getExplicitOrMeasuredWidth(), getExplicitOrMeasuredHeight());
            }
            findFocusCandidates(this);
            var _loc_1:* = 0;
            while (_loc_1 < numChildren)
            {
                
                _loc_2 = getChildAt(_loc_1) as IUIComponent;
                if (_loc_2)
                {
                    _loc_2.initialize();
                }
                _loc_1++;
            }
            dispatchEvent(new FlexEvent(FlexEvent.INITIALIZE));
            dispatchEvent(new FlexEvent(FlexEvent.CREATION_COMPLETE));
            return;
        }// end function

        public function resolveAutomationIDPart(param1:Object) : Array
        {
            if (automationDelegate)
            {
                return automationDelegate.resolveAutomationIDPart(param1);
            }
            return [];
        }// end function

        public function setFocus() : void
        {
            stage.focus = focusableObjects[reverseDirectionFocus ? ((focusableObjects.length - 1)) : (0)];
            addFocusEventListeners();
            return;
        }// end function

        public function set percentHeight(param1:Number) : void
        {
            _percentHeight = param1;
            notifySizeChanged();
            return;
        }// end function

        public function get horizontalCenter()
        {
            return _horizontalCenter;
        }// end function

        override public function set width(param1:Number) : void
        {
            explicitWidth = param1;
            return;
        }// end function

        public function set maxWidth(param1:Number) : void
        {
            explicitMaxWidth = param1;
            return;
        }// end function

        protected function sizeChanged(param1:Number, param2:Number) : Boolean
        {
            return Math.abs(param1 - param2) > 1;
        }// end function

        public function owns(param1:DisplayObject) : Boolean
        {
            while (param1 && param1 != this)
            {
                
                if (param1 is IUIComponent)
                {
                    param1 = IUIComponent(param1).owner;
                    continue;
                }
                param1 = param1.parent;
            }
            return param1 == this;
        }// end function

        public function set explicitMaxHeight(param1:Number) : void
        {
            _explicitMaxHeight = param1;
            notifySizeChanged();
            return;
        }// end function

        public function setVisible(param1:Boolean, param2:Boolean = false) : void
        {
            super.visible = param1;
            if (!param2)
            {
                dispatchEvent(new FlexEvent(param1 ? (FlexEvent.SHOW) : (FlexEvent.HIDE)));
            }
            return;
        }// end function

        private function buildStateMap() : void
        {
            var _loc_1:* = currentLabels;
            stateMap = {};
            var _loc_2:* = 0;
            while (_loc_2 < _loc_1.length)
            {
                
                stateMap[_loc_1[_loc_2].name] = _loc_1[_loc_2];
                _loc_2++;
            }
            return;
        }// end function

        public function get maxHeight() : Number
        {
            return isNaN(explicitMaxHeight) ? (10000) : (explicitMaxHeight);
        }// end function

        public function deleteReferenceOnParentDocument(param1:IFlexDisplayObject) : void
        {
            if (id && id != "")
            {
                param1[id] = null;
            }
            return;
        }// end function

        public function set horizontalCenter(param1) : void
        {
            var _loc_2:* = this.horizontalCenter;
            if (_loc_2 !== param1)
            {
                this._2016110183horizontalCenter = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "horizontalCenter", _loc_2, param1));
            }
            return;
        }// end function

        protected function dispatchResizeEvent() : void
        {
            var _loc_1:* = new ResizeEvent(ResizeEvent.RESIZE);
            _loc_1.oldWidth = oldWidth;
            _loc_1.oldHeight = oldHeight;
            dispatchEvent(_loc_1);
            oldWidth = width;
            oldHeight = height;
            return;
        }// end function

        public function get isPopUp() : Boolean
        {
            return _isPopUp;
        }// end function

        public function get percentHeight() : Number
        {
            return _percentHeight;
        }// end function

        override public function get width() : Number
        {
            if (!isNaN(_width))
            {
                return _width;
            }
            return super.width;
        }// end function

        public function set explicitMinWidth(param1:Number) : void
        {
            _explicitMinWidth = param1;
            notifySizeChanged();
            return;
        }// end function

        public function get explicitMaxHeight() : Number
        {
            return _explicitMaxHeight;
        }// end function

        public function move(param1:Number, param2:Number) : void
        {
            this.x = param1;
            this.y = param2;
            if (param1 != oldX || param2 != oldY)
            {
                dispatchMoveEvent();
            }
            return;
        }// end function

        public function get toolTip() : String
        {
            return _toolTip;
        }// end function

        public function set explicitWidth(param1:Number) : void
        {
            _explicitWidth = param1;
            explicitSizeChanged = true;
            notifySizeChanged();
            return;
        }// end function

        public function get parentDocument() : Object
        {
            var _loc_1:* = null;
            var _loc_2:* = null;
            if (document == this)
            {
                _loc_1 = parent as IUIComponent;
                if (_loc_1)
                {
                    return _loc_1.document;
                }
                _loc_2 = parent as ISystemManager;
                if (_loc_2)
                {
                    return _loc_2.document;
                }
                return null;
            }
            else
            {
                return document;
            }
        }// end function

        override public function set tabEnabled(param1:Boolean) : void
        {
            super.tabEnabled = param1;
            explicitTabEnabledChanged = true;
            return;
        }// end function

        public function set toolTip(param1:String) : void
        {
            var _loc_2:* = ApplicationDomain.currentDomain.getDefinition("mx.managers.ToolTipManager");
            var _loc_3:* = _toolTip;
            _toolTip = param1;
            if (_loc_2)
            {
                var _loc_4:* = _loc_2;
                _loc_4.mx_internal::registerToolTip(this, _loc_3, param1);
            }
            return;
        }// end function

        private function dispatchMoveEvent() : void
        {
            var _loc_1:* = new MoveEvent(MoveEvent.MOVE);
            _loc_1.oldX = oldX;
            _loc_1.oldY = oldY;
            dispatchEvent(_loc_1);
            oldX = x;
            oldY = y;
            return;
        }// end function

        public function drawFocus(param1:Boolean) : void
        {
            return;
        }// end function

        public function set measuredMinHeight(param1:Number) : void
        {
            _measuredMinHeight = param1;
            return;
        }// end function

        public function get explicitWidth() : Number
        {
            return _explicitWidth;
        }// end function

        public function get measuredMinHeight() : Number
        {
            return _measuredMinHeight;
        }// end function

        public function get automationTabularData() : Object
        {
            if (automationDelegate)
            {
                return automationDelegate.automationTabularData;
            }
            return null;
        }// end function

    }
}
