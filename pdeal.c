#include "mex.h"

void dofor(double *reu, int lf, int li, double *foci, double *index){
    int i, j;
    double *ed;
    ed = mxCalloc(lf , sizeof(double));
    for(i=0; i<li; i++){
        for(j=0; j<lf; j++){
            ed[j]=(index[i]-foci[j])*(index[i]-foci[j])+(index[i+li]-foci[j+lf])*(index[i+li]-foci[j+lf]);
        }
        reu[i] = ed[0];
        for(j=0; j<lf; j++)
            if(ed[j]<reu[i]) reu[i] = ed[j];
    }
}

void mexFunction(int nlhs,mxArray *plhs[],int nrhs,const mxArray *prhs[]){
    double * reu;
    double * foci , * index;
    int lf , li;
    
    foci  = mxGetPr(prhs[0]);
    index = mxGetPr(prhs[1]);
    
    lf = mxGetM(prhs[0]);
    li = mxGetM(prhs[1]);
    
    plhs[0] = mxCreateDoubleMatrix(1,li,mxREAL);
    reu = mxGetPr(plhs[0]);
    
    dofor(reu , lf , li , foci , index);
}