// @flow
/* eslint-disable react/prefer-stateless-function */
import React, { Component } from 'react';
import { NativeEventEmitter, NativeModules, requireNativeComponent } from 'react-native';

const { NotificationCenterData } = NativeModules;

const NCEventEmitter = new NativeEventEmitter(NotificationCenterData);
const NCEventName = 'NCPeriodicalData';

const ncSubscription = NCEventEmitter.addListener(
    NCEventName,
    (data: string[]) => console.log('NC data: ', data),
);

const MODULE_NAME = 'ChartView';
const Chart = requireNativeComponent(MODULE_NAME, null);


type PropsType = {|
    +xValues: string[],
    +yValues: number[],
|};

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

export default ChartView;
