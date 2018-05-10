// @flow
import React, { Component } from 'react';
import { NativeEventEmitter, NativeModules, requireNativeComponent } from 'react-native';

const { DirectEventDataManager, NotificationCenterDataManager } = NativeModules;

const NCEventEmitter = new NativeEventEmitter(NotificationCenterDataManager);
const NCEventName = 'NCPeriodicalData';
const DEventEmitter = new NativeEventEmitter(DirectEventDataManager);
const DEventName = 'DirectEventData2';

type PropsType = {|
    +xValues: string[],
    +yValues: number[],
|};

const ncSubscription = NCEventEmitter.addListener(
    NCEventName,
    (data: string[]) => console.log('NC data: ', data),
);
const dSubscription = DEventEmitter.addListener(
    DEventName,
    (data: number[]) => console.log('Direct data: ', data),
);

class ChartView extends Component<PropsType> {
    componentWillUnmount() {
        ncSubscription.remove();
        dSubscription.remove();
    }

    render() {
        const { xValues, yValues } = this.props;

        return (
            <Chart
                xValues={xValues}
                yValues={yValues}
                style={{ flex: 1 }}
            />
        );
    }
}

const MODULE_NAME = 'Chart'; // it's always looking for *Manager
const Chart = requireNativeComponent(MODULE_NAME, null);

export default ChartView;
