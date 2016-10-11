Redux vs MobX
=============

MobX notes
----------
*   derivations in MobX are always run synchronously    <<< awesome
    *   even if a derivation is triggered unexpectedly, you simply can find the causing mutation back in your stack
*   functions need to be decorated as actions before they are allowed to modify the state, so that you can clearly
    recognize them, and not modify state anywhere else
*   mobx-react already forbids currently to change the state inside the render function of a component. This is done
    internally through the function mobx.extras.allowStateChanges(false, block)