other
_struct

"
typedef struct {
	OopType	objId;			/* 4/01 OOP_ILLEGAL in datapage indicates free chunk */
	OopType	objClass;		/* 4/05 dependencies on segment being immediately after */
	OopType	segment;		/* 4/09 */
	long			objSize;			/* 4/13 object: the logical size of the object */

#if !defined(FLG_LOW_BITS) 2/17
/* compilers that pack starting with most significant bit: */
    OBJ_HDR_BF_TYPE spare1   : 1;  /* reserved to extend format to weak arrays*/
    OBJ_HDR_BF_TYPE objKind     : 2;  /* OC_FORMAT_OOP, OC_FORMAT_BYTE,
                                        OC_FORMAT_NSC, OC_FORMAT_SPECIAL */
    OBJ_HDR_BF_TYPE isInvariant : 1; 
    OBJ_HDR_BF_TYPE levels      : 2;  /* value > 0 indicates lrg obj */
    OBJ_HDR_BF_TYPE tagSize     : 3;  /* number of tags on object */
    OBJ_HDR_BF_TYPE directStore : 1;  /* true if not large, no tags ,
                                      is not Invariant, and no constraints */
    OBJ_HDR_BF_TYPE inPomRemSet : 1;  /* fromOm bit in interp VC cache */
    OBJ_HDR_BF_TYPE inLomRemSet : 1;  /* markedBit in interp VC cache */
    OBJ_HDR_BF_TYPE spare2      : 1;  
    OBJ_HDR_BF_TYPE objSpace    : 3;
#else
/* compilers that pack starting with least significant bit: */
    OBJ_HDR_BF_TYPE objSpace    : 3;
    OBJ_HDR_BF_TYPE spare2      : 1;  
    OBJ_HDR_BF_TYPE inLomRemSet : 1;
    OBJ_HDR_BF_TYPE inPomRemSet : 1;
    OBJ_HDR_BF_TYPE directStore : 1;
    OBJ_HDR_BF_TYPE tagSize     : 3;
    OBJ_HDR_BF_TYPE levels      : 2;
    OBJ_HDR_BF_TYPE isInvariant : 1; 
    OBJ_HDR_BF_TYPE objKind     : 2;
    OBJ_HDR_BF_TYPE spare1      : 1;  
#endif
	unsigned short physSize;     /* 2/19 physical size of the object or free chunk*/
}	ObjHdrSType;
"
