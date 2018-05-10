// @flow
/* eslint-disable react/prefer-stateless-function */
import React, { Component } from 'react';

type PropsType = {|
    +xValues: string[],
    +yValues: number[],
|};

class ChartView extends Component<PropsType> {
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
