# Sustainable Harvesting in a Predator–Prey Fishery

An ODE model of predator and prey fish populations with harvesting of the predator, analysed for stability and optimised for long-run yield.

**TU/e · Ordinary Differential Equations modelling project (2WA70) · Grade 9.0/10**

<!-- REPORT_LINK -->

## Motivation

Over-fishing threatens top predators such as hammerhead sharks: the abundance index of the scalloped hammerhead fell by 67% between 1970 and 2020. Removing predators lets prey populations grow unchecked, which harms biodiversity.

## Model and analysis

- Logistic prey growth, Lotka–Volterra predation and harvesting of the predator. Constant, linear ($h = a\,y$) and Holling type II ($h = a\,y/(1 + b\,y)$) harvesting were compared, and linear harvesting was chosen for the main model.
- Reduced the parameters by non-dimensionalisation, then found the equilibria and their stability from the eigenvalues of the linearised system.
- Proved existence (Peano) and uniqueness (Picard–Lindelöf) of solutions and constructed a Lyapunov function.
- Maximised the equilibrium yield over the harvesting rate, giving $a^\ast = (\delta - \zeta)/(2\nu)$ and $Q_{\max}(t) = \frac{(\delta-\zeta)^2\,\alpha}{4\,\nu\,\delta\,\mu}\,(t - t_0)$, valid as long as a non-trivial equilibrium exists.
- Simulated 100 and 1,000 days with MATLAB's `ode45` and drew phase planes with direction fields, including for the Holling type II variant.

**My individual extension:** competition for resources between two fish species, modelled with the Lotka–Volterra competition equations, using species-specific carrying capacities and asymmetric competition coefficients.

## Repository contents

- `src/predator_prey_1000_days.m`: 1,000-day simulation and phase plane with linear harvesting
- `src/holling_type_ii.m`: the same with a Holling type II harvesting term

**Tools:** MATLAB
