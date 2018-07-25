function fku = odefun(t,s)

%Using SI units
q = 1.60217662E-19;
m_e = 1.60217662E-31;
[Bx, By, Bz] = bwrap();
fku = [s(4); s(5); s(6); (q/m_e)*(s(5)*Bz(s(1),s(2),s(3)) - s(6)*By(s(1),s(2),s(3))); (q/m_e)*(s(6)*Bx(s(1),s(2),s(3)) - s(4)*Bz(s(1),s(2),s(3))); (q/m_e)*(s(4)*By(s(1),s(2),s(3)) - s(5)*Bx(s(1),s(2),s(3)))];

end
