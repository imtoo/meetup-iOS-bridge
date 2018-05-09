// @flow
import PropTypes from 'prop-types';
import React, { Component } from 'react';
import { requireNativeComponent } from 'react-native';

type Props = {|
	+xValues: [String],
	+yValues: [Int],
|};

class ChartView extends Component<Props> {
    render() {
        const { xValues, yValues } = this.props;

        return (
            <Chart
                xValues={xValues}
                yValues={yValues}
                style={{ flex: 1}}
            />
        );
    }
}

ChartView.propTypes = {
    xValues: PropTypes.array,
    yValues: PropTypes.array,
};

const MODULE_NAME = 'Chart'; // it's always looking for *Manager
const Chart = requireNativeComponent(MODULE_NAME, ChartView);

export default ChartView;
