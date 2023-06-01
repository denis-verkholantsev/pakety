import numpy as np
from scipy.integrate import solve_ivp
import matplotlib.pyplot as plt

def equation(t, u):
    x, y, z = u
    return np.array([10 * (y - x), x * (29 - z) - y, x * y - (8 / 3) * z])

def runge_kutta(h, t, u):
    k1 = h * equation(t, u)
    k2 = h * equation(t + h / 2, u + k1 / 2)
    k3 = h * equation(t + h / 2, u + k2 / 2)
    k4 = h * equation(t + h, u + k3)
    return u + (k1 + 2 * k2 + 2 * k3 + k4) / 6


def RK(F_0, t_span, h):
    t_range = np.arange(t_span[0], t_span[1], h)
    F_n = np.zeros((len(t_range), len(F_0)))
    F_n[0] = F_0
    for i in range(len(t_range) - 1):
        F_n[i + 1] = runge_kutta(h, t_range[i], F_n[i])
    return F_n, t_range


def ivpsolve(F_0,t_span):
    solution_ivp = solve_ivp(equation, t_span, F_0, dense_output=True)
    t_range_ivp = np.linspace(t_span[0], t_span[1], num=1000)
    F_n_ivp = solution_ivp.sol(t_range_ivp)
    return F_n_ivp, t_range_ivp


def plot(F_n_ivp, t_range_ivp, F_n, t_range):
    plt.plot(t_range, F_n[:, 0], label='RK - x')
    plt.plot(t_range, F_n[:, 1], label='RK - y')
    plt.plot(t_range, F_n[:, 2], label='RK - z')
    plt.plot(t_range_ivp, F_n_ivp[1], label='ivp - y')
    plt.plot(t_range_ivp, F_n_ivp[0], label='ivp - x')
    plt.plot(t_range_ivp, F_n_ivp[2], label='ivp - z')
    plt.xlabel('t')
    plt.ylabel('Значение')
    plt.legend()
    plt.grid(True)
    plt.show()


F_0 = [0, 1, 20]
t_span = (0, 1)
h = 0.01
F_n_ivp, t_range_ivp = ivpsolve(F_0, t_span)
F_n, t_range = RK(F_0, t_span, h)
plot(F_n_ivp, t_range_ivp, F_n, t_range)

