// @flow
import React, { Component } from 'react';
import { NativeEventEmitter, NativeModules, requireNativeComponent } from 'react-native';

const { NotificationCenterData } = NativeModules;

const NCEventEmitter = new NativeEventEmitter(NotificationCenterData);
const NCEventName = 'NCPeriodicalData';

type PropsType = {|
    +xValues: string[],
    +yValues: number[],
|};

const ncSubscription = NCEventEmitter.addListener(
    NCEventName,
    (data: string[]) => console.log('NC data: ', data),
);

class ChartView extends Component<PropsType> {
    componentWillUnmount() {
        ncSubscription.remove();
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

const MODULE_NAME = 'ChartView'; // In case of RCTViewManager it's always looking for *Manager suffix - ChartViewManager
const Chart = requireNativeComponent(MODULE_NAME, null);

export default ChartView;
