Summary Report
Aim:
1) To implement backpropagation algorithm to train a MLP learn to solve the parity problem.
2) To observe the effect of learning rate ղ on the number of epochs.
3) To observe the effect of momentum term on the speed of training for every value of ղ.
Summary:
Back Propagation:
For solving the parity problem, we have used an MLP with 5 input units, including bias, four hidden neurons and an intermediate bias and an output neuron. We have used the back propagation algorithm to train the MLP, by calculating the error, propagating the delta backwards and updating the weights in every epoch. The algorithm has converged in finite number of iterations.

Effect of learning rate:
Learning rate plays a very important role in the convergence of back propagation algorithm. It is well known that if the learning rate is large, the algorithm converges in less number of epochs and if the learning rate is small, it converges slowly. But, if n is too large, the algorithm doesn’t converge. Hence, we have to choose an optimum value of ղ so that the algorithm converges in less number of epochs. The value of ղ can be selected by learning rate annealing using stochastic approximation or search then converge methods. We usually set ղ to be large and then decrease it gradually. We have done the same in this case too. Initially, we have taken a learning rate of 0.5 and gradually decreased it in equal intervals to 0.05. It is observed that the least number of epochs are achieved for a ղ value of 0.5 and as the value is decreased, the number of epochs increased gradually. It can be observed from the results. Also, the weights and errors are approximately equal for all the values of ղ.
Effect of momentum:
Momentum is used while updating the weights in each epoch for controlling the learning rate. When ղ is large, weights tend to oscillate and hence, the algorithm never converges. Momentum is added to stabilize the weights so that the algorithm converges. Here, in this case, the momentum has decreased the number of epochs for ղ=0.5 from 49636 to 5160. Whereas, it increased the number of epochs for ղ=0.5. This is not as expected ideally. This might be due to the selection of weights and setting the seed. This has changed if we change the seed to 80. The number of epochs decreased from 146430 to 26134 for ղ = 0.05 to 0.5 , as expected.



