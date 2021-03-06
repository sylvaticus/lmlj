using Test
using DelimitedFiles, LinearAlgebra
import MLJBase
const Mlj = MLJBase
using StableRNGs
rng = StableRNG(123)
using BetaML.Trees

println("*** Additional testing for the Testing Decision trees/Random Forest algorithms...")

println("Testing MLJ interface for Trees models....")
X, y                           = Mlj.@load_boston
model_dtr                      = DecisionTreeRegressor()
regressor_dtr                  = Mlj.machine(model_dtr, X, y)
Mlj.evaluate!(regressor_dtr, resampling=Mlj.CV(), measure=Mlj.rms, verbosity=0)

model_rfr                      = RandomForestRegressor()
regressor_rfr                  = Mlj.machine(model_rfr, X, y)
Mlj.evaluate!(regressor_rfr, resampling=Mlj.CV(), measure=Mlj.rms, verbosity=0)


X, y                           = Mlj.@load_iris
model_dtc                      = DecisionTreeClassifier()
regressor_dtc                  = Mlj.machine(model_dtc, X, y)
Mlj.evaluate!(regressor_dtc, resampling=Mlj.CV(), measure=Mlj.LogLoss())

model_rfc                      = RandomForestClassifier(maxFeatures=3)
regressor_rfc                  = Mlj.machine(model_rfc, X, y)
Mlj.evaluate!(regressor_rfc, resampling=Mlj.CV(), measure=Mlj.LogLoss())

#=
using MLJ
X, y                           = Mlj.@load_boston
MLJ.models(MLJ.matching(X,y))
Tree = @load DecisionTreeRegressor pkg=BetaML
tree = Tree()
=#
