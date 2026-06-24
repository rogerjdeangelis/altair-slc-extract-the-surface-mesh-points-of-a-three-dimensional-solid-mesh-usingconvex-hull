%let pgm=altair-slc-extract-the-surface-mesh-points-of-a-three-dimensional-solis-mesh-usingconvex-hull;

%stop_submission;

Altair slc extract the surface mesh points of a three dimensional solid mesh using convex hull

I encased my solid body mesh points in a ICOSAHEDRON (12 vertices of a polyhedron) to test the algorithm.
If the algorithm works, the code will output the 12 vertices of the ICOSAHEDRON as the surface mesh..

Convex Hull graphic
https://github.com/rogerjdeangelis/altair-slc-extract-the-surface-mesh-points-of-a-three-dimensional-solid-mesh-usingconvex-hull/blob/main/convex_hull_3d.png

Too long to post here, see github
https://github.com/rogerjdeangelis/altair-slc-extract-the-surface-mesh-points-of-a-three-dimensional-solid-mesh-usingconvex-hull

Contents
  1 Inupt SLC table
  2 Pyhton convex hull
  3 Verification ICOSAHEDRON encasing mesh

Here are the vertices of a 12 sided ICOSAHEDRON that should form the surface of the solid mesk..

          X       Y       Z

       0.0000  4.7551  1.5451
       0.0000  4.7551 -1.5451
       0.0000 -4.7551  1.5451
       0.0000 -4.7551 -1.5451
       4.7551  1.5451  0.0000
      -4.7551  1.5451  0.0000
       4.7551 -1.5451  0.0000
      -4.7551 -1.5451  0.0000
       1.5451  0.0000  4.7551
      -1.5451  0.0000  4.7551
       1.5451  0.0000 -4.7551
      -1.5451  0.0000 -4.7551

Related repos
https://github.com/rogerjdeangelis/utl-altair-slc-compute-angles-lengths-perimiter-area-of-arbitrary-convex-polygon
https://github.com/rogerjdeangelis/utl-altair-slc-geofencing-geocoding-reverse-geocoding-address-standadization-convex-hull-envelops
https://github.com/rogerjdeangelis/utl-altair-personal-slc-identify-centroids-of-clusters-and-plot-convex-hull
https://github.com/rogerjdeangelis/utl-draw-polygons-around-clusters-of-points-r-convex-hulls
https://github.com/rogerjdeangelis/utl-identify-the-outer-most-points-in-a-graph-object-ai-convex-hulls
https://github.com/rogerjdeangelis/utl_convex_hull_maximum-distance-between-two-points-in-a-scatter-plot
https://github.com/rogerjdeangelis/utl_convex_hull_polygons_encompassing_a_three_dimensional_scatter_plot
https://github.com/rogerjdeangelis/utl_simple_convex_hull_polygon_envelop_for_a_scatter_plot

/*   _                   _         _        _        _     _
/ | (_)_ __  _ __  _   _| |_   ___| | ___  | |_ __ _| |__ | | ___
| | | | `_ \| `_ \| | | | __| / __| |/ __| | __/ _` | `_ \| |/ _ \
| | | | | | | |_) | |_| | |_  \__ \ | (__  | || (_| | |_) | |  __/
|_| |_|_| |_| .__/ \__,_|\__| |___/_|\___|  \__\__,_|_.__/|_|\___|
            |_|
*/

libname workx sas7bdat "d:/wpswrkx"; /*--- put this in your autoexec ---*/

/*--- INPUT ---*/
options validvarname=v7;
data workx.scatter;
  input x y z @@;
cards4;
 1.30472 -2.03998  1.75045 -1.35626  1.73752 -1.93362
 1.12784 -1.31624 -1.01680 -1.20544 -1.95002 -1.33903
-1.85304  1.87940  1.77779  1.84031 -2.72732  1.43442
 1.06603  2.12724  1.46751  1.23774 -1.59415 -2.44606
-1.85929  1.36875 -1.95888  1.07213 -1.52949  1.23268
 1.87845 -1.04993 -1.18486  1.02185  2.60178 -1.23936
-1.68093  2.22254 -1.15453 -2.02350  1.17928  1.22000
-1.42833 -1.35213  1.53231  2.35919  1.83511  1.35687
 1.36544  1.41273  1.43082  2.46330 -2.18876 -1.63975
 3.14165 -1.40642 -1.51224 -1.92658 -1.38981 -2.37669
-1.81377  1.61598  2.12897  1.63515 -1.22222 -2.47081
-1.11395 -1.84016 -1.82448 -2.01558  1.31351  1.83813
 1.65059  1.74325  1.54315  0.0000  4.7551  1.5451
-1.66551  1.23216  1.11669  0.0000  4.7551 -1.5451
 1.21869  1.87143  1.22360  0.0000 -4.7551  1.5451
-2.32270 -1.99725  1.39977  0.0000 -4.7551 -1.5451
 1.67891  1.06758  1.28912  4.7551  1.5451  0.0000
 1.63129 -2.45716 -1.31967 -4.7551  1.5451  0.0000
-1.47037 -1.63888 -1.27514  4.7551 -1.5451  0.0000
-2.68287 -1.33489  1.16275 -4.7551 -1.5451  0.0000
 1.58622  1.71123  1.79335  1.5451  0.0000  4.7551
-1.34873 -1.46235  1.85798 -1.5451  0.0000  4.7551
-1.19130 -2.27569 -2.13329  1.5451  0.0000 -4.7551
-1.91945  1.49716  1.14243 -1.5451  0.0000 -4.7551
 1.69049 -1.42725  1.15854 -2.19584  1.48697 -1.46940
 1.62559 -1.30935  1.45678  1.01249  1.48075  1.44653
-1.66193 -1.36305 -1.38174  1.66539 -1.09849 -1.42330
;;;;
run;quit;

/**************************************************************************************************************************/
/*| workx.scatter total obs=57                                                                                            */
/*|                                                                                                                       */
/*| Obs        x           y           z                                                                                  */
/*|                                                                                                                       */
/*|   1     1.30472    -2.03998     1.75045                                                                               */
/*|   2    -1.35626     1.73752    -1.93362                                                                               */
/*|   3     1.94056    -2.95104    -2.30218                                                                               */
/*|   4    -1.20544    -1.95002    -1.33903                                                                               */
/*|   5     1.12784    -1.31624    -1.01680                                                                               */
/*|  ...                                                                                                                  */
/*|  53    -1.66193    -1.36305    -1.38174                                                                               */
/*|  54    -2.19584     1.48697    -1.46940                                                                               */
/*|  55     1.01249     1.48075     1.44653                                                                               */
/*|  56     1.66539    -1.09849    -1.42330                                                                               */
/*|  57    -1.07972    -2.68733    -2.44711                                                                               */
/**************************************************************************************************************************/

/*
| | ___   __ _
| |/ _ \ / _` |
| | (_) | (_| |
|_|\___/ \__, |
         |___/
*/

1                                          Altair SLC        15:26 Wednesday, June 24, 2026

NOTE: Copyright 2002-2025 World Programming, an Altair Company
NOTE: Altair SLC 2026 (05.26.01.00.000758)
      Licensed to Roger DeAngelis
NOTE: This session is executing on the X64_WIN11PRO platform and is running in 64 bit mode

NOTE: AUTOEXEC processing beginning; file is C:\wpsoto\autoexec.sas
NOTE: AUTOEXEC source line
1       +  ï»¿ods _all_ close;
           ^
ERROR: Expected a statement keyword : found "?"

NOTE: AUTOEXEC processing completed

1         options validvarname=v7;
2         data workx.scatter;
3           input x y z @@;
4         cards4;

NOTE: A new line was read when INPUT statement read past the end of a line
NOTE: Data set "WORKX.scatter" has 54 observation(s) and 3 variable(s)
NOTE: The data step took :
      real time : 0.000
      cpu time  : 0.015

ERROR: Error printed on page 1

NOTE: Submitted statements took :
      real time : 0.110
      cpu time  : 0.093

/*___                _   _                                                  _           _ _
|___ \   _ __  _   _| |_| |__   ___  _ __     ___ ___  _ ____   _______  __| |__  _   _| | |
  __) | | `_ \| | | | __| `_ \ / _ \| `_ \   / __/ _ \| `_ \ \ / / _ \ \/ /| `_ \| | | | | |
 / __/  | |_) | |_| | |_| | | | (_) | | | | | (_| (_) | | | \ V /  __/>  < | | | | |_| | | |
|_____| | .__/ \__, |\__|_| |_|\___/|_| |_|  \___\___/|_| |_|\_/ \___/_/\_\|_| |_|\__,_|_|_|
        |_|    |___/
*/

%utlfkil(d:/png/convex_hull_3d.png);

options validvarname=v7;
options set=PYTHONHOME "D:\py314";
proc python;
submit;
import os
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from scipy.spatial import ConvexHull
import pyreadstat as ps

# slc table to panda dataframe
df,meta = ps.read_sas7bdat('d:/wpswrkx/scatter.sas7bdat')

# Convex hull from DataFrame columns
pts = df[["x", "y", "z"]].to_numpy()
hull = ConvexHull(pts)

# get the encasing points;
hull_idx = np.unique(hull.simplices.ravel())
hull_df = df.iloc[hull_idx][["x", "y", "z"]].reset_index(drop=True)
print(hull_df)

# Plot
fig = plt.figure(figsize=(3.0, 2.4))
ax = fig.add_subplot(111, projection="3d")

ax.scatter(df["x"], df["y"], df["z"], s=10, color="royalblue", alpha=0.5)

for simplex in hull.simplices:
    tri = pts[simplex]
    tri = np.vstack([tri, tri[0]])
    ax.plot(tri[:, 0], tri[:, 1], tri[:, 2], color="crimson", lw=1.2)

ax.set_title("3D Scatter Plot with Convex Hull", fontsize=5)
ax.set_xlabel("X", fontsize=4)
ax.set_ylabel("Y", fontsize=4)
ax.set_zlabel("Z", fontsize=4)
ax.tick_params(axis='both', labelsize=4)
outdir = r"D:\png"
os.makedirs(outdir, exist_ok=True)
outfile = os.path.join(outdir, "convex_hull_3d.png")

plt.tight_layout()
plt.savefig(outfile, dpi=300, bbox_inches="tight")
plt.close(fig)

print(outfile)
endsubmit;
import python=hull_df data=workx.encasing_points;
run;

/*
| | ___   __ _
| |/ _ \ / _` |
| | (_) | (_| |
|_|\___/ \__, |
         |___/
*/

1                                          Altair SLC        15:38 Wednesday, June 24, 2026

NOTE: Copyright 2002-2025 World Programming, an Altair Company
NOTE: Altair SLC 2026 (05.26.01.00.000758)
      Licensed to Roger DeAngelis
NOTE: This session is executing on the X64_WIN11PRO platform and is running in 64 bit mode

NOTE: AUTOEXEC processing beginning; file is C:\wpsoto\autoexec.sas
NOTE: AUTOEXEC source line
1       +  ï»¿ods _all_ close;
           ^
ERROR: Expected a statement keyword : found "?"
NOTE: Library workx assigned as follows:
      Engine:        SAS7BDAT
      Physical Name: d:\wpswrkx

NOTE: Library wpdx assigned as follows:
      Engine:        WPD
      Physical Name: d:\wpswrkx

NOTE: Library slchelp assigned as follows:
      Engine:        WPD
      Physical Name: C:\Progra~1\Altair\SLC\2026\sashelp


LOG:  15:38:59
NOTE: 1 record was written to file PRINT

NOTE: The data step took :
      real time : 0.032
      cpu time  : 0.015


NOTE: Format num2mis output
NOTE: Format $chr2mis output
NOTE: Procedure format step took :
      real time : 0.016
      cpu time  : 0.000


NOTE: AUTOEXEC processing completed

1
2         %utlfkil(d:/png/convex_hull_3d.png);
3
4         options validvarname=v7;
5         options set=PYTHONHOME "D:\py314";
6         proc python;
7         submit;
8         import os
9         import numpy as np
10        import pandas as pd
11        import matplotlib.pyplot as plt
12        from scipy.spatial import ConvexHull
13        import pyreadstat as ps
14
15        # slc table to panda dataframe
16        df,meta = ps.read_sas7bdat('d:/wpswrkx/scatter.sas7bdat')
17
18        # Convex hull from DataFrame columns
19        pts = df[["x", "y", "z"]].to_numpy()
20        hull = ConvexHull(pts)
21
22        # get the encasing points;
23        hull_idx = np.unique(hull.simplices.ravel())
24        hull_df = df.iloc[hull_idx][["x", "y", "z"]].reset_index(drop=True)
25        print(hull_df)
26
27        # Plot
28        fig = plt.figure(figsize=(3.0, 2.4))
29        ax = fig.add_subplot(111, projection="3d")
30
31        ax.scatter(df["x"], df["y"], df["z"], s=10, color="royalblue", alpha=0.5)
32
33        for simplex in hull.simplices:
34            tri = pts[simplex]
35            tri = np.vstack([tri, tri[0]])
36            ax.plot(tri[:, 0], tri[:, 1], tri[:, 2], color="crimson", lw=1.2)
37
38        ax.set_title("3D Scatter Plot with Convex Hull", fontsize=5)
39        ax.set_xlabel("X", fontsize=4)
40        ax.set_ylabel("Y", fontsize=4)
41        ax.set_zlabel("Z", fontsize=4)
42        ax.tick_params(axis='both', labelsize=4)
43        outdir = r"D:\png"
44        os.makedirs(outdir, exist_ok=True)
45        outfile = os.path.join(outdir, "convex_hull_3d.png")
46
47        plt.tight_layout()
48        plt.savefig(outfile, dpi=300, bbox_inches="tight")
49        plt.close(fig)
50
51        print(outfile)
52        endsubmit;

NOTE: Submitting statements to Python:


53        import python=hull_df data=workx.encasing_points;
NOTE: Creating data set 'WORKX.encasing_points' from Python data frame 'hull_df'
NOTE: Data set "WORKX.encasing_points" has 12 observation(s) and 3 variable(s)

54        run;
NOTE: Procedure python step took :
      real time : 2.829
      cpu time  : 0.031


ERROR: Error printed on page 1

NOTE: Submitted statements took :
      real time : 2.961
      cpu time  : 0.171


/*____                  _  __ _           _   _                          _               _
|___ /  __   _____ _ __(_)/ _(_) ___ __ _| |_(_) ___  _ __    ___  _   _| |_ _ __  _   _| |_
  |_ \  \ \ / / _ \ `__| | |_| |/ __/ _` | __| |/ _ \| `_ \  / _ \| | | | __| `_ \| | | | __|
 ___) |  \ V /  __/ |  | |  _| | (_| (_| | |_| | (_) | | | || (_) | |_| | |_| |_) | |_| | |_
|____/    \_/ \___|_|  |_|_| |_|\___\__,_|\__|_|\___/|_| |_| \___/ \__,_|\__| .__/ \__,_|\__|
                                                                            |_|
*/

proc delete data=workx.markpts;
run;quit;

/*-- Identify the encasing points ---*/

proc sql;
  create
     table workx.markpts as
  select
     l.x
    ,l.y
    ,l.z
    ,case
       when  (l.x=r.x and l.y=r.y and l.z=r.z) then 'O'
       else 'I'
     end as ltr
  from
    workx.scatter as l left join workx.encasing_points as r
  on
    l.x = r.x and
    l.y = r.y and
    l.z = r.z
;quit;


options ls=64 ps=32;
proc plot data=workx.markpts;
  plot z*x=ltr/ box;
  plot z*y=ltr/ box;
  plot y*x=ltr/ box;
run;


/**************************************************************************************************************************/
/*                                                                                                                        */
/* PYTHON OUTPUT VERIFIES ICOSAHEDRON MESH                                                                                */
/*                                                                                                                        */
/*  INPUT ICOSAHEDRON             Python output finds the surface ICOSAHEDRON                                             */
/*           x       y       z                                                                                            */
/*  0   0.0000  4.7551  1.5451      0.0000  4.7551  1.5451                                                                */
/*  1   0.0000  4.7551 -1.5451      0.0000  4.7551 -1.5451                                                                */
/*  2   0.0000 -4.7551  1.5451      0.0000 -4.7551  1.5451                                                                */
/*  3   0.0000 -4.7551 -1.5451      0.0000 -4.7551 -1.5451                                                                */
/*  4   4.7551  1.5451  0.0000      4.7551  1.5451  0.0000                                                                */
/*  5  -4.7551  1.5451  0.0000     -4.7551  1.5451  0.0000                                                                */
/*  6   4.7551 -1.5451  0.0000      4.7551 -1.5451  0.0000                                                                */
/*  7  -4.7551 -1.5451  0.0000     -4.7551 -1.5451  0.0000                                                                */
/*  8   1.5451  0.0000  4.7551      1.5451  0.0000  4.7551                                                                */
/*  9  -1.5451  0.0000  4.7551     -1.5451  0.0000  4.7551                                                                */
/*  10  1.5451  0.0000 -4.7551      1.5451  0.0000 -4.7551                                                                */
/*  11 -1.5451  0.0000 -4.7551     -1.5451  0.0000 -4.7551                                                                */
/*                                                                                                                        */
/*                                                                                                                        */
/*                          Z*X PLANE                                                                                     */
/*                                                                                                                        */
/*              Plot of z*x.  Symbol is value of ltr.                                                                     */
/*                                                                                                                        */
/*      --+--------+--------+--------+--------+--------+--------+--                                                       */
/*      |                                                         |                                                       */
/*      |  Projecting the 3d mesh onto the xz plabe               |                                                       */
/*      |                                                         |                                                       */
/*      |  The interior points are              O=outer points    |                                                       */
/*      |  projected Y (colapsed Y values)      I Inner points    |                                                       */
/*    Z |                                                         |                                                       */
/*  5.0 +                     O             O                     +  5.0                                                  */
/*      |                                                         |                                                       */
/*      |                                                         |                                                       */
/*      |                                                         |                                                       */
/*      |                                                         |                                                       */
/*  2.5 +                                                         +  2.5                                                  */
/*      |                   II I           II                     |                                                       */
/*      |                  I   I     O    IIII  I                 |                                                       */
/*   Z  |                I  I I           I  I                    |   Z                                                   */
/*      |                                                         |                                                       */
/*  0.0 +       O                                         O       +  0.0                                                  */
/*      |                                                         |                                                       */
/*      |                    I            I  I                    |                                                       */
/*      |                  I  I I    O      I   I  I              |                                                       */
/*      |                    I II                                 |                                                       */
/* -2.5 +                   I              II                     + -2.5                                                  */
/*      |                                                         |                                                       */
/*      |                                                         |                                                       */
/*      |                                                         |                                                       */
/*      |                                                         |                                                       */
/* -5.0 +                     O             O                     + -5.0                                                  */
/*      |                                                         |                                                       */
/*      --+--------+--------+--------+--------+--------+--------+--                                                       */
/*       -6       -4       -2        0        2        4        6                                                         */
/*                                   Xx                                                                                   */
/*                                                                                                                        */
/*                                                                                                                        */
/*                           Z*Y PLANE                                                                                    */
/*                                                                                                                        */
/*              Plot of z*y.  Symbol is value of ltr.                                                                     */
/*                                                                                                                        */
/*      --+--------+--------+--------+--------+--------+--------+--                                                       */
/*    Z |                                                         |                                                       */
/*  5.0 +                            O                            +                                                       */
/*      |                                                         |                                                       */
/*      |                                                         |                                                       */
/*      |                                                         |                                                       */
/*      |                                                         |                                                       */
/*  2.5 +                                                         +                                                       */
/*      |                   I I            III                    |                                                       */
/*      |       O        I  I  I          IIII I          O       |                                                       */
/*      |                     II          IIII                    |                                                       */
/*      |                                                         |                                                       */
/*  0.0 +                     O             O                     +                                                       */
/*      |                                                         |                                                       */
/*      |                      II              I I                |                                                       */
/*      |       O         III III           I             O       |                                                       */
/*      |                  I I             I I                    |                                                       */
/* -2.5 +                     III                                 +                                                       */
/*      |                                                         |                                                       */
/*      |                                                         |                                                       */
/*      |                                                         |                                                       */
/*      |                                                         |                                                       */
/* -5.0 +                            O                            +                                                       */
/*      |                                                         |                                                       */
/*      --+--------+--------+--------+--------+--------+--------+--                                                       */
/*       -6       -4       -2        0        2        4        6                                                         */
/*                                   Y                                                                                    */
/*                        Y*X PLANE                                                                                       */
/*                                                                                                                        */
/*              Plot of y*x.  Symbol is value of ltr.                                                                     */
/*                                                                                                                        */
/*      --+--------+--------+--------+--------+--------+--------+--                                                       */
/*    Y |                                                         |                                                       */
/*  5.0 +                            O                            +                                                       */
/*      |                                                         |                                                       */
/*      |                                                         |                                                       */
/*      |                                                         |                                                       */
/*      |                                                         |                                                       */
/*  2.5 +                                 I                       +                                                       */
/*      |                    I            I     I                 |                                                       */
/*      |       O          III I          III             O       |                                                       */
/*      |                   I I              I                    |                                                       */
/*      |                                                         |                                                       */
/*  0.0 +                     O             O                     +                                                       */
/*      |                                                         |                                                       */
/*      |                                   II                    |                                                       */
/*      |       O        I  I II          IIII     I      O       |                                                       */
/*      |                  I    I          I    I                 |                                                       */
/* -2.5 +                       I           II                    +                                                       */
/*      |                                                         |                                                       */
/*      |                                                         |                                                       */
/*      |                                                         |                                                       */
/*      |                                                         |                                                       */
/* -5.0 +                            O                            +                                                       */
/*      |                                                         |                                                       */
/*      --+--------+--------+--------+--------+--------+--------+--                                                       */
/*       -6       -4       -2        0        2        4        6                                                         */
/*                                   X                                                                                    */
/*                                                                                                                        */
/**************************************************************************************************************************/

/*              _
  ___ _ __   __| |
 / _ \ `_ \ / _` |
|  __/ | | | (_| |
 \___|_| |_|\__,_|

*/
