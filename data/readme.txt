4_10_1.dat
input: sweep frequency signal
format: time angle_velocity angle motor_velocity

4_10_2.dat
input: sweep frequency signal
format: time angle_velocity angle motor_acc

4_12_1.dat
input: sweep frequency signal
format: time angle_velocity angle motor_acc motor_velocity

4_12_2.dat
input: sweep frequency signal
format: time angle_velocity angle motor_acc motor_velocity

4_17_1.dat
input: sweep frequency signal
format: time angle_velocity angle motor_acc motor_velocity controller_output

4_18_1.dat
input: appointed sine signal 
format: time angle_velocity angle motor_acc motor_velocity controller_output

4_18_2.dat
input: appointed sine signal 
format: time angle_velocity angle motor_acc motor_velocity controller_output
changes: in former version,motor output only change one time in five simple times. motor output changes every simple times now.

4_18_3.dat
input: appointed sine signal 
format: time angle_velocity angle motor_acc motor_velocity controller_output
changes: use a higher amplitude sine signal.

4_18_4.dat
input: appointed sine signal 
format: time angle_velocity angle motor_acc motor_velocity controller_output
discribe: as same as last one. used for check model identified by last data.

4_19_1.dat
input: appointed sine signal
format: time angle_velocity angle motor_output(velocity) controller_output(acc) gyro_raw acc_raw
discribe: start record imu raw data. controller output store motor accelemeter instead of motor velocity.

4_19_2.dat
input: appointed sine signal
format: time angle_velocity angle motor_output(velocity) controller_output(acc) gyro_raw acc_raw
discribe: as same as last one. used for check model identified by last data.

6_25_1.dat(6_25_2.dat)
input: appointed sine signal
format: time angle_velocity angle motor_output(velocity) controller_output(acc) gyro_raw acc_raw
discribe: using new hardware mcar 2.0

6_28_1.dat(6_28_2.dat)
input: controller only
format: time angle_velocity angle motor_output(velocity) controller_output(acc) gyro_raw acc_raw

6_29_1.dat(6_29_2.dat)
input: sine signal only
format: time angle_velocity angle motor_output(velocity) sine_signal(acc) gyro_raw acc_raw

7_13_1.dat(7_13_2.dat)
input: sine signal only
format: time angle_velocity angle motor_output(velocity)  gyro_raw acc_raw_direction acc_raw
discribe: acc_raw used to record accelemeter data after direction correction. acc_raw record pure raw data now.

7_14_1.dat(7_14_2.dat)
input: sine signal only
format: time angle_velocity angle sine_signal(acc)  gyro_raw acc_raw_direction acc_raw

8_3_1.dat(8_3_2.dat)
input: pid controller
format: time angle_velocity angle controller_output(acc)  gyro_raw acc_raw_direction acc_raw

9_21_1.dat(9_21_2.dat)
input: pid controller
format: time angle angle_velocity motor_velocity motor_acc

10_6.dat
input: 1Hz sine signal
format:time angle_velocity angle motor_velocity motor_angle
discribe: fixed imu to motor axis.

10_7.dat
input: 0.2 Hz sine signal
format:time angle_velocity angle motor_velocity motor_angle
discribe: fixed imu to motor axis.

10_7_1.dat
input: 5 Hz sine signal
format:time angle_velocity angle motor_velocity motor_angle
discribe: fixed imu to motor axis.

10_7_2.dat
input: 1Hz sine signal
format:time angle_velocity angle motor_velocity motor_angle
discribe: fixed imu to motor axis.

10_14_1.dat (10_14_2.dat / 10_14_3.dat)
input: 2Hz (5Hz / 7Hz) sine signal
format:time angle_velocity angle motor_velocity motor_angle
discribe: fixed imu to motor axis.

10_18_1.dat (10_18_2.dat / 10_18_3.dat / 10_18_4.dat)
input: 1Hz (3Hz / 5Hz / 7Hz) sine signal
format:time angle_velocity angle motor_velocity motor_angle angle_kalman angle_velocity_kalman
discribe: changed sensor and motor unit

10_22_1.dat (10_22_2.dat / 10_22_3.dat / 10_22_4.dat)
input: 1Hz (3Hz / 5Hz / 7Hz) sine signal
format:time angle_velocity angle motor_velocity motor_angle angle_kalman angle_velocity_kalman
discribe: changed matrix R in kalman filter

10_23_1.dat (10_23_2.dat)
input: sweep frequency signal
format:time body_angle_kalman body_velocity_kalman motor_velocity motor_acc
discribe: used new kalman filter