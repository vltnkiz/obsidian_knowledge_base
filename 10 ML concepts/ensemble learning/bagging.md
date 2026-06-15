ideas: [[bootstrapping]], [[bagging]], [[random forest]]

Bagging uses [[bootstrapping]] to build diversity: train B independent models, each on a different bootstrap sample. Since each model sees slightly different data, they make different errors. When you average their predictions, those errors cancel out → lower variance, same bias.