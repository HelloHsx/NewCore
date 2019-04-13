/*
SQLyog 企业版 - MySQL GUI v7.14 
MySQL - 5.5.28-enterprise-commercial-advanced-log : Database - net4erp
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`net4erp` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `net4erp`;

/*Table structure for table `advance` */

DROP TABLE IF EXISTS `advance`;

CREATE TABLE `advance` (
  `advanceid` varchar(50) NOT NULL DEFAULT '' COMMENT '单据号码',
  `advancedate` date DEFAULT NULL COMMENT '单据日期',
  `customerid` varchar(50) DEFAULT NULL COMMENT '供应商',
  `currid` varchar(50) DEFAULT NULL COMMENT '币别',
  `exchrete` double DEFAULT NULL COMMENT '汇率',
  `cashstylename` varchar(50) DEFAULT NULL COMMENT '现金结算方式1名称',
  `cash` double DEFAULT NULL COMMENT '结算1金额',
  `visastylename` varchar(50) DEFAULT NULL COMMENT '转账结算方式2名称',
  `visa` double DEFAULT NULL COMMENT '结算2金额',
  `otherpaystylename` varchar(50) DEFAULT NULL COMMENT '结算方式3名称',
  `otherpay` double DEFAULT NULL COMMENT '结算3金额',
  `accmonthtomonth` date DEFAULT NULL COMMENT '终止帐月',
  `deptfrom` varchar(50) DEFAULT NULL COMMENT '所属部门',
  `maker` varchar(50) DEFAULT NULL COMMENT '制单人员',
  `permtter` varchar(50) DEFAULT NULL COMMENT '复核人员',
  `remarks` varchar(50) DEFAULT NULL COMMENT '备注',
  `fhdate` date DEFAULT NULL COMMENT '复核时间',
  `fhsta` int(11) DEFAULT '0' COMMENT '复核状态',
  PRIMARY KEY (`advanceid`),
  KEY `FK_customerid` (`customerid`),
  KEY `FK_deptfrom` (`deptfrom`),
  KEY `FK_maker` (`maker`),
  KEY `FK_permtter` (`permtter`),
  CONSTRAINT `FK_customerid` FOREIGN KEY (`customerid`) REFERENCES `supplier` (`SupplierId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_deptfrom` FOREIGN KEY (`deptfrom`) REFERENCES `dept` (`deptID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_maker` FOREIGN KEY (`maker`) REFERENCES `person` (`personNo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_permtter` FOREIGN KEY (`permtter`) REFERENCES `person` (`personNo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `advance` */

/*Table structure for table `advancelist` */

DROP TABLE IF EXISTS `advancelist`;

CREATE TABLE `advancelist` (
  `advanceid` varchar(50) NOT NULL DEFAULT '' COMMENT '预付款主单据号码',
  `line` int(11) NOT NULL DEFAULT '0' COMMENT '栏号',
  `imprest` double DEFAULT NULL COMMENT '预付金额',
  `prepaybalance` float DEFAULT NULL COMMENT '预付余额',
  `sourcetype` varchar(50) DEFAULT NULL COMMENT '来源单别',
  `sourcebill` varchar(50) DEFAULT NULL COMMENT '来源单号',
  `summary` varchar(50) DEFAULT NULL COMMENT '摘要',
  PRIMARY KEY (`advanceid`,`line`),
  KEY `FK_sourcetype` (`sourcetype`),
  CONSTRAINT `FK_sourcetype` FOREIGN KEY (`sourcetype`) REFERENCES `bill_type` (`billTypeName`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `advancelist` */

/*Table structure for table `baojiaxiangxi` */

DROP TABLE IF EXISTS `baojiaxiangxi`;

CREATE TABLE `baojiaxiangxi` (
  `DocumentNumber` varchar(50) NOT NULL DEFAULT '' COMMENT '单据编号',
  `ColumnNumber` int(11) NOT NULL DEFAULT '0' COMMENT '栏号',
  `MaterialNO` varchar(50) NOT NULL COMMENT '物料编号',
  `MaterialName` varchar(50) NOT NULL COMMENT '物料名称',
  `SpecificationType` varchar(50) NOT NULL COMMENT '规格型号',
  `UnitName` varchar(50) NOT NULL COMMENT '单位名称',
  `Numbert` int(11) NOT NULL COMMENT '数量',
  `BeforeDiscount` decimal(9,2) NOT NULL COMMENT '折扣前单价',
  `FoldingNumber` decimal(9,2) NOT NULL COMMENT '折数',
  `UnitPrice` decimal(9,2) NOT NULL COMMENT '单价',
  `Money` decimal(9,2) NOT NULL COMMENT '金额',
  `TaxRate` decimal(9,2) NOT NULL COMMENT '税率',
  `TaxAmount` decimal(9,2) NOT NULL COMMENT '税额',
  `TaxIncluded` decimal(9,2) NOT NULL COMMENT '含税金额',
  `Gift` int(11) NOT NULL COMMENT '是否为赠品',
  `Remark` varchar(200) NOT NULL COMMENT '备注',
  PRIMARY KEY (`DocumentNumber`,`ColumnNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `baojiaxiangxi` */

/*Table structure for table `baojiazhubiao` */

DROP TABLE IF EXISTS `baojiazhubiao`;

CREATE TABLE `baojiazhubiao` (
  `DocumentNumber` varchar(50) NOT NULL COMMENT '单据号码',
  `BillDate` date NOT NULL COMMENT '单据日期',
  `FormalCustomer` varchar(50) NOT NULL COMMENT '正式客户',
  `DeliveryAddress` varchar(50) NOT NULL COMMENT '送货地址',
  `Customerid` varchar(15) NOT NULL COMMENT '客户id',
  `OrderMaker` varchar(50) NOT NULL COMMENT '制单人员',
  `Reviewer` varchar(50) NOT NULL COMMENT '复核人员',
  `MakeId` int(11) NOT NULL COMMENT '制单人员id',
  `ReviewerId` varchar(50) NOT NULL COMMENT '复核人员id',
  `DxchangeRate` decimal(10,0) NOT NULL COMMENT '汇率',
  `TaxIncluded` int(11) NOT NULL COMMENT '单价是否含税',
  `EffectiveDate` date NOT NULL COMMENT '有效日期',
  `SalesId` varchar(50) NOT NULL COMMENT '业务人员id',
  `Sales` varchar(50) NOT NULL COMMENT '业务人员',
  `DepartmentID` varchar(50) NOT NULL COMMENT '所属部门id',
  `Department` varchar(50) NOT NULL COMMENT '所属部门',
  `Remarks` varchar(200) NOT NULL COMMENT '备注',
  PRIMARY KEY (`DocumentNumber`),
  KEY `fk2` (`Customerid`),
  KEY `fk4` (`ReviewerId`),
  KEY `fk5` (`SalesId`),
  KEY `fk6` (`DepartmentID`),
  CONSTRAINT `fk6` FOREIGN KEY (`DepartmentID`) REFERENCES `dept` (`deptID`),
  CONSTRAINT `fk2` FOREIGN KEY (`Customerid`) REFERENCES `customer_data` (`KID`),
  CONSTRAINT `fk4` FOREIGN KEY (`ReviewerId`) REFERENCES `person` (`personNo`),
  CONSTRAINT `fk5` FOREIGN KEY (`SalesId`) REFERENCES `person` (`personNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `baojiazhubiao` */

/*Table structure for table `bill_type` */

DROP TABLE IF EXISTS `bill_type`;

CREATE TABLE `bill_type` (
  `billTypeName` varchar(50) NOT NULL COMMENT '单据类型名称',
  `btNo` int(11) NOT NULL COMMENT '编号',
  `btName` varchar(50) DEFAULT NULL COMMENT '小类型名称',
  `Note` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`billTypeName`,`btNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `bill_type` */

/*Table structure for table `caigoumax` */

DROP TABLE IF EXISTS `caigoumax`;

CREATE TABLE `caigoumax` (
  `poBillNO` varchar(50) NOT NULL COMMENT '订单号码',
  `billDate` date DEFAULT NULL COMMENT '订单日期',
  `CustimerID` varchar(50) DEFAULT NULL COMMENT '供应商',
  `CustAddress` varchar(50) DEFAULT NULL COMMENT '供应商地址',
  `BillStyleID` varchar(50) DEFAULT NULL COMMENT '订单类型',
  `FactCurrency` varchar(50) DEFAULT NULL COMMENT '币别',
  `PriceOfTax` int(11) DEFAULT NULL COMMENT '单价是否含税',
  `BillStatus` varchar(50) DEFAULT NULL COMMENT '单况',
  `makerID` int(11) DEFAULT NULL COMMENT '制单人员',
  `permitterID` varchar(50) DEFAULT NULL COMMENT '复核人员',
  `SalesID` int(11) DEFAULT NULL COMMENT '采购人员',
  `departID` varchar(50) DEFAULT NULL COMMENT '所属部门',
  `permitDate` date DEFAULT NULL COMMENT '复核',
  PRIMARY KEY (`poBillNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `caigoumax` */

/*Table structure for table `caigoumx` */

DROP TABLE IF EXISTS `caigoumx`;

CREATE TABLE `caigoumx` (
  `lineID` int(11) DEFAULT NULL COMMENT '行号',
  `poBillNO` varchar(50) NOT NULL COMMENT '订单号码',
  `prodID` varchar(50) DEFAULT NULL COMMENT '物料编号',
  `podNum` int(11) DEFAULT NULL COMMENT '数量	',
  `OlderPrice` double DEFAULT NULL COMMENT '折扣前单价',
  `FoldingName` double DEFAULT NULL COMMENT '折数	',
  `UnitPrice` double DEFAULT NULL COMMENT '单价',
  `amount` double DEFAULT NULL COMMENT '金额	',
  `TaxRate` double DEFAULT NULL COMMENT '税率	',
  `TaxAmt` double DEFAULT NULL COMMENT '税额	',
  `vfTotal` double DEFAULT NULL COMMENT '含税金额',
  `tranType` varchar(50) DEFAULT NULL COMMENT '来源单别',
  `fromNo` varchar(50) DEFAULT NULL COMMENT '来源单号	',
  `IsGift` int(11) DEFAULT NULL COMMENT '赠品	',
  PRIMARY KEY (`poBillNO`),
  CONSTRAINT `fk_gys2` FOREIGN KEY (`poBillNO`) REFERENCES `caigoumax` (`poBillNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `caigoumx` */

/*Table structure for table `cangku` */

DROP TABLE IF EXISTS `cangku`;

CREATE TABLE `cangku` (
  `whID` varchar(50) NOT NULL COMMENT '仓库编号',
  `whName` varchar(50) DEFAULT NULL COMMENT '仓库名称',
  `shortName` varchar(50) DEFAULT NULL COMMENT '仓库简称',
  `linkMan` varchar(50) DEFAULT NULL COMMENT '联系人员 ',
  `telePhone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `whAddress` varchar(50) DEFAULT NULL COMMENT '仓库地址',
  `memo` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`whID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `cangku` */

/*Table structure for table `cost_type` */

DROP TABLE IF EXISTS `cost_type`;

CREATE TABLE `cost_type` (
  `FeeClassID` int(11) NOT NULL DEFAULT '0' COMMENT '费用编号',
  `FeeClassName` varchar(50) DEFAULT NULL COMMENT '费用名称',
  PRIMARY KEY (`FeeClassID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `cost_type` */

/*Table structure for table `curr` */

DROP TABLE IF EXISTS `curr`;

CREATE TABLE `curr` (
  `CurrID` int(11) NOT NULL COMMENT '币别编号',
  `CurrName` varchar(50) NOT NULL COMMENT '币别名称',
  `CurrShortName` varchar(50) DEFAULT NULL COMMENT '币别简称',
  PRIMARY KEY (`CurrID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `curr` */

/*Table structure for table `customer_data` */

DROP TABLE IF EXISTS `customer_data`;

CREATE TABLE `customer_data` (
  `KID` varchar(15) NOT NULL COMMENT '客户编号--主键',
  `FundsAttribution` varchar(15) NOT NULL COMMENT ' 账款归属',
  `KName` varchar(40) NOT NULL COMMENT '客户全称',
  `KTypeID` int(11) NOT NULL COMMENT '外键--客户类别',
  `KShortName` varchar(20) NOT NULL COMMENT '客户简称',
  `AddressName` varchar(100) NOT NULL COMMENT '地区',
  `EngFullName` varchar(50) NOT NULL COMMENT '英文全称',
  `CurrID` varchar(10) NOT NULL COMMENT '币别',
  `EngShortName` varchar(10) DEFAULT NULL COMMENT '英文简称',
  PRIMARY KEY (`KID`),
  KEY `KTypeID` (`KTypeID`),
  CONSTRAINT `customer_data_ibfk_1` FOREIGN KEY (`KTypeID`) REFERENCES `customer_type` (`KTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `customer_data` */

/*Table structure for table `customer_data_detail` */

DROP TABLE IF EXISTS `customer_data_detail`;

CREATE TABLE `customer_data_detail` (
  `KID` varchar(15) NOT NULL COMMENT '客户编号，外键',
  `AmountQuota` decimal(9,2) NOT NULL COMMENT '账款额度',
  `RemainQuota` decimal(9,2) NOT NULL COMMENT '剩余额度',
  `RecvWay` varchar(10) NOT NULL COMMENT '收款条件',
  `DistDays` int(11) DEFAULT NULL COMMENT '收款天数',
  `DayOfClose` int(11) NOT NULL COMMENT '每月结账日',
  `CreditLevel` varchar(2) NOT NULL COMMENT '信用等级',
  `InvoTypeID` varchar(15) DEFAULT NULL COMMENT '发票类型',
  `AccReceivable` varchar(20) DEFAULT NULL COMMENT '应收账款科目',
  `StartAdvRecv` decimal(9,2) NOT NULL COMMENT '期初预收款',
  `StartReceivable` decimal(9,2) NOT NULL COMMENT '期初应收款',
  `CurAdvRecv` decimal(9,2) NOT NULL COMMENT '期末预收款',
  `CurReceivable` decimal(9,2) NOT NULL COMMENT '期末应收款',
  `NotInvQuota` decimal(9,2) NOT NULL COMMENT '未开票金额',
  `AccAdvRecv` varchar(20) DEFAULT NULL COMMENT '预收账款科目',
  PRIMARY KEY (`KID`),
  CONSTRAINT `customer_data_detail_ibfk_1` FOREIGN KEY (`KID`) REFERENCES `customer_data` (`KID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `customer_data_detail` */

/*Table structure for table `customer_type` */

DROP TABLE IF EXISTS `customer_type`;

CREATE TABLE `customer_type` (
  `KTypeID` int(11) NOT NULL COMMENT '类别编号',
  `ClassName` varchar(20) NOT NULL COMMENT '类别名称',
  `EngName` varchar(20) NOT NULL COMMENT '英文名称',
  `Memo` varchar(20) NOT NULL COMMENT '备注',
  PRIMARY KEY (`KTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `customer_type` */

/*Table structure for table `dept` */

DROP TABLE IF EXISTS `dept`;

CREATE TABLE `dept` (
  `deptID` varchar(50) NOT NULL COMMENT '部门编号',
  `deptName` varchar(50) NOT NULL COMMENT '部门名称',
  `deptEnglish` varchar(50) DEFAULT NULL COMMENT '部门名称',
  `deptnote` varchar(500) DEFAULT NULL COMMENT '部门名称',
  PRIMARY KEY (`deptID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `dept` */

/*Table structure for table `detailed_list` */

DROP TABLE IF EXISTS `detailed_list`;

CREATE TABLE `detailed_list` (
  `XsBillno` varchar(50) NOT NULL,
  `ProdID` varchar(50) NOT NULL,
  `ProName` varchar(50) NOT NULL,
  `Sunit` varchar(50) NOT NULL,
  `Squantity` int(11) NOT NULL,
  `Sprice` decimal(9,2) NOT NULL,
  `OldPrice` decimal(9,2) NOT NULL,
  `Amount` decimal(9,2) NOT NULL,
  `TaxRate` decimal(9,2) NOT NULL,
  `TaxAmt` decimal(9,2) NOT NULL,
  `Discount` decimal(9,2) NOT NULL,
  `IsGift` int(11) NOT NULL,
  `PreInDate` date NOT NULL,
  `FromNo` varchar(50) NOT NULL,
  `VFTotal` decimal(9,2) NOT NULL,
  `ItemRemark` varchar(200) NOT NULL,
  `TramType` varchar(50) NOT NULL,
  PRIMARY KEY (`XsBillno`),
  KEY `FK_detailed_list6664` (`ProdID`),
  CONSTRAINT `FK_detailed_list6664` FOREIGN KEY (`ProdID`) REFERENCES `baojiazhubiao` (`DocumentNumber`),
  CONSTRAINT `FK_detailed_list` FOREIGN KEY (`ProdID`) REFERENCES `wuliaotable` (`WuLiao_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `detailed_list` */

/*Table structure for table `diaobozhubiao` */

DROP TABLE IF EXISTS `diaobozhubiao`;

CREATE TABLE `diaobozhubiao` (
  `DbBillNo` varchar(50) NOT NULL COMMENT '单据号码',
  `BillDate` date NOT NULL COMMENT '单据日期',
  `CallOutStorehouse` varchar(50) NOT NULL COMMENT '调出仓库',
  `CallInorehouse` varchar(50) NOT NULL COMMENT '调入仓库',
  `MakeId` varchar(50) NOT NULL COMMENT '制单人员id',
  `Make` varchar(50) NOT NULL COMMENT '制单人员',
  `Permitter` varchar(50) NOT NULL COMMENT '复核人员',
  `PermitterId` varchar(50) NOT NULL COMMENT '复核人员Id',
  `Remark` varchar(50) NOT NULL COMMENT '备注',
  PRIMARY KEY (`DbBillNo`),
  KEY `fk7` (`CallOutStorehouse`),
  KEY `fk8` (`CallInorehouse`),
  KEY `fk9` (`MakeId`),
  KEY `fk10` (`PermitterId`),
  CONSTRAINT `fk10` FOREIGN KEY (`PermitterId`) REFERENCES `person` (`personNo`),
  CONSTRAINT `fk3` FOREIGN KEY (`MakeId`) REFERENCES `person` (`personNo`),
  CONSTRAINT `fk7` FOREIGN KEY (`CallOutStorehouse`) REFERENCES `cangku` (`whID`),
  CONSTRAINT `fk8` FOREIGN KEY (`CallInorehouse`) REFERENCES `cangku` (`whID`),
  CONSTRAINT `fk9` FOREIGN KEY (`MakeId`) REFERENCES `person` (`personNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `diaobozhubiao` */

/*Table structure for table `diaojiaxiangxi` */

DROP TABLE IF EXISTS `diaojiaxiangxi`;

CREATE TABLE `diaojiaxiangxi` (
  `DbBillNo` varchar(50) NOT NULL DEFAULT '' COMMENT '单据号码',
  `No` int(11) NOT NULL DEFAULT '0' COMMENT '栏号',
  `MatterNo` varchar(50) DEFAULT NULL COMMENT '物料编号',
  `MatterName` varchar(50) NOT NULL COMMENT '物料名称',
  `Specification` varchar(50) NOT NULL COMMENT '规格型号',
  `UnitName` varchar(50) NOT NULL COMMENT '单位名称',
  `Number` int(11) NOT NULL COMMENT '数量',
  `BtchNmber` int(11) NOT NULL COMMENT '批号',
  `Remark` varchar(200) NOT NULL COMMENT '备注',
  PRIMARY KEY (`DbBillNo`,`No`),
  KEY `fk11` (`MatterNo`),
  CONSTRAINT `fk11` FOREIGN KEY (`MatterNo`) REFERENCES `wuliaotable` (`WuLiao_ID`),
  CONSTRAINT `fk1` FOREIGN KEY (`MatterNo`) REFERENCES `wuliaotable` (`WuLiao_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `diaojiaxiangxi` */

/*Table structure for table `dsfunddetail` */

DROP TABLE IF EXISTS `dsfunddetail`;

CREATE TABLE `dsfunddetail` (
  `FundBillID` varchar(50) NOT NULL COMMENT '单据号码',
  `CustomerID` varchar(50) NOT NULL COMMENT '客户编号',
  `FromOrderNo` varchar(50) NOT NULL COMMENT '来源单号',
  `OriginFlag` varchar(50) NOT NULL COMMENT '来源单别,默认为销售订单',
  `AddMoney` decimal(9,2) NOT NULL COMMENT '预收金额',
  `Rummary` varchar(50) DEFAULT NULL COMMENT '摘要',
  `Memo` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`FundBillID`),
  CONSTRAINT `FundBillID` FOREIGN KEY (`FundBillID`) REFERENCES `dsfundmain` (`FundBillID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `dsfunddetail` */

/*Table structure for table `dsfundmain` */

DROP TABLE IF EXISTS `dsfundmain`;

CREATE TABLE `dsfundmain` (
  `FundBillID` varchar(50) NOT NULL COMMENT '单据号码',
  `CustomerID` varchar(50) NOT NULL COMMENT '客户编号',
  `FundBillDate` date NOT NULL COMMENT '单据日期',
  `CashStyleID` int(11) NOT NULL COMMENT '结算方式一编号',
  `CashPay` decimal(9,2) DEFAULT NULL COMMENT '结算一【默认为0】',
  `VisaStyleID` int(11) NOT NULL COMMENT '结算方式二编号',
  `VisaPay` decimal(9,2) NOT NULL COMMENT '结算二【默认为0】',
  `OtherStyleID` int(11) DEFAULT NULL COMMENT '结算方式三编号',
  `OtherPay` decimal(9,2) DEFAULT NULL COMMENT '结算三【默认为0】',
  `CurrID` int(11) NOT NULL COMMENT '币别',
  `Rate` decimal(2,2) NOT NULL COMMENT '汇率（默认为1）',
  `DiscountPer` decimal(2,2) NOT NULL COMMENT '折扣率（%）【默认为0】',
  `AccMonthToMonth` date NOT NULL COMMENT '终止账月(默认为当月)',
  `VoucherNo` varchar(50) DEFAULT NULL COMMENT '凭证编号',
  `DeptTo` varchar(50) NOT NULL COMMENT '所属部门',
  `ProjectTo` varchar(50) DEFAULT NULL COMMENT '所属项目',
  `Maker` varchar(50) DEFAULT NULL COMMENT '制单人员',
  `Permitter` varchar(50) DEFAULT NULL COMMENT '复核人员',
  PRIMARY KEY (`FundBillID`),
  KEY `DeptTo` (`DeptTo`),
  KEY `CustomerID` (`CustomerID`),
  KEY `CashStyleID` (`CashStyleID`),
  KEY `VisaStyleID` (`VisaStyleID`),
  KEY `OtherStyleID` (`OtherStyleID`),
  CONSTRAINT `OtherStyleID` FOREIGN KEY (`OtherStyleID`) REFERENCES `curr` (`CurrID`),
  CONSTRAINT `CashStyleID` FOREIGN KEY (`CashStyleID`) REFERENCES `curr` (`CurrID`),
  CONSTRAINT `CustomerID` FOREIGN KEY (`CustomerID`) REFERENCES `customer_data` (`KID`),
  CONSTRAINT `DeptTo` FOREIGN KEY (`DeptTo`) REFERENCES `dept` (`deptID`),
  CONSTRAINT `VisaStyleID` FOREIGN KEY (`VisaStyleID`) REFERENCES `curr` (`CurrID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `dsfundmain` */

/*Table structure for table `dsfundpayway` */

DROP TABLE IF EXISTS `dsfundpayway`;

CREATE TABLE `dsfundpayway` (
  `ClassID` int(11) NOT NULL COMMENT '编号',
  `ClassName` varchar(50) NOT NULL COMMENT '结算名称',
  `EngClassName` varchar(50) DEFAULT NULL COMMENT '英文名称',
  `Memo` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`ClassID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `dsfundpayway` */

/*Table structure for table `getorigin` */

DROP TABLE IF EXISTS `getorigin`;

CREATE TABLE `getorigin` (
  `OriginNo` varchar(50) NOT NULL COMMENT '应收冲款单号',
  `BillType` int(11) NOT NULL COMMENT '来源单别',
  `FromOriderNo` varchar(50) NOT NULL COMMENT '来源单号',
  `PrepayLeft` decimal(9,2) NOT NULL COMMENT '预收余额',
  `DepartID` varchar(50) NOT NULL COMMENT '部门编号',
  `DepartName` varchar(50) DEFAULT NULL COMMENT '部门名称',
  `LocalUseMoney` varchar(50) NOT NULL COMMENT '取用预收金额',
  `CustName` varchar(50) NOT NULL COMMENT '交易对象名称',
  `FromDescription` varchar(200) DEFAULT NULL COMMENT '来源摘要',
  PRIMARY KEY (`OriginNo`),
  KEY `DepartID` (`DepartID`),
  CONSTRAINT `DepartID` FOREIGN KEY (`DepartID`) REFERENCES `dept` (`deptID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `getorigin` */

/*Table structure for table `inventory_list` */

DROP TABLE IF EXISTS `inventory_list`;

CREATE TABLE `inventory_list` (
  `BillNo` varchar(50) NOT NULL COMMENT '单据号码',
  `AdjustDate` date NOT NULL COMMENT '单据日期',
  `Makerid` varchar(50) NOT NULL COMMENT '制单人员',
  `Permitter` varchar(50) DEFAULT NULL COMMENT '复核人员',
  `WareId` varchar(50) NOT NULL COMMENT '盘点仓库id',
  `Remark` varchar(50) DEFAULT NULL COMMENT '备注',
  `PersonnelID` varchar(50) NOT NULL COMMENT '盘点人员',
  `DepartName` varchar(50) NOT NULL COMMENT '盘点所属部门名称',
  `PermitDate` date DEFAULT NULL COMMENT '复核时间',
  `Examine` int(11) DEFAULT NULL COMMENT '审核状态',
  PRIMARY KEY (`BillNo`),
  KEY `fk_person_list2` (`PersonnelID`),
  KEY `fk_cangku_list` (`WareId`),
  KEY `fk_person_list` (`Makerid`),
  KEY `fk_person_list1` (`Permitter`),
  CONSTRAINT `fk_person_list1` FOREIGN KEY (`Permitter`) REFERENCES `person` (`personNo`),
  CONSTRAINT `fk_cangku_list` FOREIGN KEY (`WareId`) REFERENCES `cangku` (`whID`),
  CONSTRAINT `fk_person_list` FOREIGN KEY (`Makerid`) REFERENCES `person` (`personNo`),
  CONSTRAINT `fk_person_list2` FOREIGN KEY (`PersonnelID`) REFERENCES `person` (`personNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `inventory_list` */

/*Table structure for table `inventory_list_detail` */

DROP TABLE IF EXISTS `inventory_list_detail`;

CREATE TABLE `inventory_list_detail` (
  `BillNo` varchar(50) NOT NULL COMMENT '批号单号',
  `RowNo` int(11) NOT NULL COMMENT '批号行号',
  `ProdId` varchar(50) NOT NULL COMMENT '物料编号',
  `UnitPrice` double NOT NULL COMMENT '单价',
  `CurQty` int(11) NOT NULL COMMENT '账面数量',
  `CheckQty` int(11) NOT NULL COMMENT '盘点数量',
  `Quantity` int(11) NOT NULL COMMENT '盈亏数量',
  `Amount` double NOT NULL COMMENT '盈亏金额',
  `ItemRemark` varchar(500) DEFAULT NULL COMMENT '原因',
  PRIMARY KEY (`BillNo`,`RowNo`),
  CONSTRAINT `fk_list_detail` FOREIGN KEY (`BillNo`) REFERENCES `inventory_list` (`BillNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `inventory_list_detail` */

/*Table structure for table `kucunmx` */

DROP TABLE IF EXISTS `kucunmx`;

CREATE TABLE `kucunmx` (
  `StockID` varchar(50) NOT NULL COMMENT '单号',
  `LineNumber` int(11) NOT NULL COMMENT '行号',
  `warehouse_numberID` varchar(50) DEFAULT NULL COMMENT '仓库编号',
  `material_numberID` varchar(50) DEFAULT NULL COMMENT '物料编号',
  `Num` int(11) DEFAULT NULL COMMENT '数量	',
  `Price` double DEFAULT NULL COMMENT '单价',
  `Amount_of_money` double DEFAULT NULL COMMENT '金额',
  `stockDate` date DEFAULT NULL COMMENT '日期',
  PRIMARY KEY (`StockID`,`LineNumber`),
  KEY `fk_gys3` (`material_numberID`),
  KEY `fk_gys4` (`warehouse_numberID`),
  CONSTRAINT `fk_gys4` FOREIGN KEY (`warehouse_numberID`) REFERENCES `cangku` (`whID`),
  CONSTRAINT `fk_gys3` FOREIGN KEY (`material_numberID`) REFERENCES `wuliaotable` (`WuLiao_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `kucunmx` */

/*Table structure for table `kucunzcb` */

DROP TABLE IF EXISTS `kucunzcb`;

CREATE TABLE `kucunzcb` (
  `warehouse_numberID` varchar(20) NOT NULL COMMENT '仓库编号',
  `material_numberID` varchar(20) DEFAULT NULL COMMENT '物料编号',
  `total_quantity` int(11) DEFAULT NULL COMMENT '数量	',
  `average` double DEFAULT NULL COMMENT '现行平均单价	',
  `total_sum` double DEFAULT NULL COMMENT '总金额	',
  PRIMARY KEY (`warehouse_numberID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `kucunzcb` */

/*Table structure for table `origindetail` */

DROP TABLE IF EXISTS `origindetail`;

CREATE TABLE `origindetail` (
  `FundBillID` varchar(50) NOT NULL COMMENT '单据号码',
  `CustomerID` varchar(50) NOT NULL COMMENT '客户编号',
  `SetNo` int(11) NOT NULL COMMENT '栏号',
  `FundBillDate` date NOT NULL COMMENT '原单日期',
  `OrginBillNo` varchar(50) NOT NULL COMMENT '原单单号',
  `InvoiceNo` varchar(50) DEFAULT NULL COMMENT '发票号码',
  `CustID` varchar(50) NOT NULL COMMENT '交易对象',
  `CustName` varchar(50) NOT NULL COMMENT '交易对象名称',
  `DeptID` int(11) NOT NULL COMMENT '部门编号',
  `DeptName` varchar(50) NOT NULL COMMENT '部门名称',
  `PersonTo` varchar(50) NOT NULL COMMENT '业务人员',
  `ProjectNameTo` varchar(50) DEFAULT NULL COMMENT '项目名称',
  `CurrID` int(11) NOT NULL COMMENT '币别',
  `Rate` decimal(2,2) NOT NULL COMMENT '汇率（默认为1)',
  `Total` decimal(9,2) NOT NULL COMMENT '原单金额',
  `NowLeft` decimal(9,2) NOT NULL COMMENT '现行余额',
  `Discount` decimal(9,2) NOT NULL COMMENT '折让金额',
  `OffSet` decimal(9,2) NOT NULL COMMENT '冲款金额',
  `OffSetMoney` decimal(9,2) NOT NULL COMMENT '冲抵余额',
  `Memo` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`FundBillID`,`SetNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `origindetail` */

/*Table structure for table `originmain` */

DROP TABLE IF EXISTS `originmain`;

CREATE TABLE `originmain` (
  `FundBillID` varchar(50) NOT NULL COMMENT '单据号码',
  `CustomerID` varchar(50) NOT NULL COMMENT '客户编号',
  `FundBillDate` date NOT NULL COMMENT '单据日期',
  `CashStyleID` int(11) NOT NULL COMMENT '结算方式一编号',
  `CashPay` decimal(9,2) DEFAULT NULL COMMENT '结算一【默认为0】',
  `VisaStyleID` int(11) NOT NULL COMMENT '结算方式二编号',
  `VisaPay` decimal(9,2) NOT NULL COMMENT '结算二【默认为0】',
  `OtherStyleID` int(11) NOT NULL COMMENT '结算方式三编号',
  `OtherPay` decimal(9,2) NOT NULL COMMENT '结算三【默认为0】',
  `CurrID` int(11) NOT NULL COMMENT '币别',
  `Rate` decimal(9,2) NOT NULL COMMENT '汇率（默认为1）',
  `DiscountPer` decimal(9,2) NOT NULL COMMENT '折扣率（%）【默认为0】',
  `AccMonthToMonth` date NOT NULL COMMENT '终止账月(默认为当月)',
  `VoucherNo` varchar(50) DEFAULT NULL COMMENT '凭证编号',
  `DeptTo` int(11) NOT NULL COMMENT '所属部门',
  `ProjectTo` varchar(50) DEFAULT NULL COMMENT '所属项目',
  `Maker` varchar(50) DEFAULT NULL COMMENT '制单人员',
  `Permitter` varchar(50) DEFAULT NULL COMMENT '复核人员',
  PRIMARY KEY (`FundBillID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `originmain` */

/*Table structure for table `paycontent` */

DROP TABLE IF EXISTS `paycontent`;

CREATE TABLE `paycontent` (
  `fundbillid` varchar(50) NOT NULL DEFAULT '' COMMENT '应付冲款主表编号',
  `line` int(11) NOT NULL DEFAULT '0' COMMENT '栏号',
  `billtype` varchar(50) DEFAULT NULL COMMENT '来源单别',
  `sobillid` varchar(50) DEFAULT NULL COMMENT '原单单号',
  `dealer` varchar(50) DEFAULT NULL COMMENT '交易对象（供应商编号）',
  `dealername` varchar(50) DEFAULT NULL COMMENT '交易对象名称（供应商名称）',
  `branchid` varchar(50) DEFAULT NULL COMMENT '部门编号',
  `branchname` varchar(50) DEFAULT NULL COMMENT '部门名称',
  `salesid` varchar(50) DEFAULT NULL COMMENT '采购人员',
  `currid` varchar(50) DEFAULT NULL COMMENT '币别',
  `exchrete` double DEFAULT NULL COMMENT '汇率',
  `somoney` double DEFAULT NULL COMMENT '原单金额',
  `agiomoney` double DEFAULT NULL COMMENT '折让金额',
  `pay` double DEFAULT NULL COMMENT '冲款金额',
  `guaranty` double DEFAULT NULL COMMENT '冲抵金额',
  PRIMARY KEY (`fundbillid`,`line`),
  KEY `FK_paycontent2_dealer` (`dealer`),
  KEY `FK_paycontent3_branchid` (`branchid`),
  KEY `FK_paycontent4_salesid` (`salesid`),
  CONSTRAINT `FK_paycontent1_fundbillid` FOREIGN KEY (`fundbillid`) REFERENCES `paymostly` (`fundbillid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_paycontent2_dealer` FOREIGN KEY (`dealer`) REFERENCES `supplier` (`SupplierId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_paycontent3_branchid` FOREIGN KEY (`branchid`) REFERENCES `dept` (`deptID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_paycontent4_salesid` FOREIGN KEY (`salesid`) REFERENCES `person` (`personNo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `paycontent` */

/*Table structure for table `paylist` */

DROP TABLE IF EXISTS `paylist`;

CREATE TABLE `paylist` (
  `fundbillid` varchar(50) NOT NULL DEFAULT '' COMMENT '应付冲款主表编号',
  `fundbilldate` date DEFAULT NULL COMMENT '单据日期',
  `fundtype` int(11) DEFAULT NULL COMMENT '单据类型',
  `dealer` varchar(50) DEFAULT NULL COMMENT '交易对象（供应商编号）',
  `somoney` double DEFAULT NULL COMMENT '原单金额',
  `nowmoney` double DEFAULT NULL COMMENT '现行余额',
  PRIMARY KEY (`fundbillid`),
  KEY `FK_paymostly_dealer` (`dealer`),
  CONSTRAINT `FK_paymostly_fundbillid` FOREIGN KEY (`fundbillid`) REFERENCES `paymostly` (`fundbillid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_paymostly_dealer` FOREIGN KEY (`dealer`) REFERENCES `supplier` (`SupplierId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `paylist` */

/*Table structure for table `paymostly` */

DROP TABLE IF EXISTS `paymostly`;

CREATE TABLE `paymostly` (
  `fundbillid` varchar(50) NOT NULL DEFAULT '' COMMENT '单据号码',
  `fundbilldate` date DEFAULT NULL COMMENT '单据日期',
  `customerid` varchar(50) DEFAULT NULL COMMENT '供应商Id',
  `currid` varchar(50) DEFAULT NULL COMMENT '人民币币别',
  `exchrete` double DEFAULT NULL COMMENT '汇率',
  `cashstylename` varchar(50) DEFAULT NULL COMMENT '现金结算方式1名称',
  `cash` double DEFAULT NULL COMMENT '结算1金额',
  `visastylename` varchar(50) DEFAULT NULL COMMENT '转账结算方式2名称',
  `visa` double DEFAULT NULL COMMENT '结算2金额',
  `otherpaystylename` varchar(50) DEFAULT NULL COMMENT '结算方式3名称',
  `accmonthtomonth` date DEFAULT NULL COMMENT '终止帐月',
  `discountper` double DEFAULT NULL COMMENT '折扣率',
  `deptfrom` varchar(50) DEFAULT NULL COMMENT '业务人员所属部门',
  `maker` varchar(50) DEFAULT NULL COMMENT '制单人员',
  `permtter` varchar(50) DEFAULT NULL COMMENT '复核人员',
  `remarks` varchar(50) DEFAULT NULL COMMENT '备注',
  `fhdate` date DEFAULT NULL COMMENT '复核时间',
  `fhsta` int(11) DEFAULT NULL COMMENT '复核状态',
  PRIMARY KEY (`fundbillid`),
  KEY `FK_paymostly_customerid` (`customerid`),
  KEY `FK_paymostly_deptfrom` (`deptfrom`),
  KEY `FK_paymostly_maker` (`maker`),
  KEY `FK_paymostly_permtter` (`permtter`),
  CONSTRAINT `FK_paymostly_customerid` FOREIGN KEY (`customerid`) REFERENCES `supplier` (`SupplierId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_paymostly_deptfrom` FOREIGN KEY (`deptfrom`) REFERENCES `dept` (`deptID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_paymostly_maker` FOREIGN KEY (`maker`) REFERENCES `person` (`personNo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_paymostly_permtter` FOREIGN KEY (`permtter`) REFERENCES `person` (`personNo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `paymostly` */

/*Table structure for table `person` */

DROP TABLE IF EXISTS `person`;

CREATE TABLE `person` (
  `personNo` varchar(50) NOT NULL COMMENT '人员编号',
  `personName` varchar(50) NOT NULL COMMENT '人员名称',
  `deptID` varchar(50) NOT NULL COMMENT '部门编号',
  `IDcard` varchar(50) NOT NULL COMMENT '身份证号',
  `sex` char(2) DEFAULT NULL COMMENT '性别',
  `age` int(11) DEFAULT NULL COMMENT '年龄',
  `study` varchar(50) DEFAULT NULL COMMENT '学历',
  `English` varchar(50) DEFAULT NULL COMMENT '英文名称',
  `startDate` date DEFAULT NULL COMMENT '合同开始日期',
  `endDate` date DEFAULT NULL COMMENT '合同终止日期',
  `note` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`personNo`),
  KEY `fk_pdeptid` (`deptID`),
  CONSTRAINT `fk_pdeptid` FOREIGN KEY (`deptID`) REFERENCES `dept` (`deptID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `person` */

/*Table structure for table `priceadjust_order` */

DROP TABLE IF EXISTS `priceadjust_order`;

CREATE TABLE `priceadjust_order` (
  `TjBillNo` varchar(50) NOT NULL,
  `AdjustDate` date DEFAULT NULL,
  `ckbh` varchar(50) DEFAULT NULL,
  `arrangeMode` int(11) DEFAULT NULL,
  `Maker` varchar(50) DEFAULT NULL,
  `Permitter` varchar(50) DEFAULT NULL,
  `Status` int(11) DEFAULT NULL,
  `Auditor` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`TjBillNo`),
  KEY `fk_scid6` (`ckbh`),
  CONSTRAINT `fk_scid6` FOREIGN KEY (`ckbh`) REFERENCES `kucunzcb` (`warehouse_numberID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `priceadjust_order` */

/*Table structure for table `priceadjust_orderdetailed` */

DROP TABLE IF EXISTS `priceadjust_orderdetailed`;

CREATE TABLE `priceadjust_orderdetailed` (
  `TjBillNo` varchar(50) NOT NULL DEFAULT '',
  `hh` int(11) NOT NULL DEFAULT '0',
  `AdjustDate` date DEFAULT NULL,
  `WuLiao_ID` varchar(50) DEFAULT NULL,
  `WuLiao_Name` varchar(50) DEFAULT NULL,
  `WuLiao_Xinhao` varchar(50) DEFAULT NULL,
  `WLcom_ID` int(11) DEFAULT NULL,
  `Inventory` int(11) DEFAULT NULL,
  `averageCost` decimal(9,2) DEFAULT NULL,
  `UnitPrice` decimal(9,2) DEFAULT NULL,
  `ModifyPrice` decimal(9,2) DEFAULT NULL,
  `EntryNotes` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`TjBillNo`,`hh`),
  KEY `FK_priceadjust_orderdetailed` (`WuLiao_ID`),
  CONSTRAINT `FK_priceadjust_orderdetailed444` FOREIGN KEY (`TjBillNo`) REFERENCES `priceadjust_order` (`TjBillNo`),
  CONSTRAINT `FK_priceadjust_orderdetailed` FOREIGN KEY (`WuLiao_ID`) REFERENCES `wuliaotable` (`WuLiao_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `priceadjust_orderdetailed` */

/*Table structure for table `purchase_allocation_datil` */

DROP TABLE IF EXISTS `purchase_allocation_datil`;

CREATE TABLE `purchase_allocation_datil` (
  `Billno` varchar(50) NOT NULL DEFAULT '' COMMENT '单据编号',
  `SerNo` int(11) NOT NULL DEFAULT '0' COMMENT '行号',
  `FeeClassID` int(11) DEFAULT NULL COMMENT '费用编号',
  `Amount` double DEFAULT NULL COMMENT '金额',
  PRIMARY KEY (`Billno`,`SerNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `purchase_allocation_datil` */

/*Table structure for table `purchase_allocation_main` */

DROP TABLE IF EXISTS `purchase_allocation_main`;

CREATE TABLE `purchase_allocation_main` (
  `Billno` varchar(50) NOT NULL DEFAULT '' COMMENT '单据编号',
  `Billdate` date DEFAULT NULL COMMENT '单据日期',
  `AssignStyle` int(11) DEFAULT NULL COMMENT '0按金额 1按数量	分摊方式',
  `MLAmount` varchar(50) DEFAULT NULL COMMENT '待摊金额本位币',
  `Maker` varchar(50) DEFAULT NULL COMMENT '制单人',
  `Permitter` varchar(50) DEFAULT NULL COMMENT '复核人',
  `fhdate` date DEFAULT NULL COMMENT '复核时间',
  `fhsta` int(11) DEFAULT NULL COMMENT '复核状态',
  PRIMARY KEY (`Billno`),
  KEY `FK_paymostly_Maker1` (`Maker`),
  KEY `FK_paymostly_Permitter2` (`Permitter`),
  CONSTRAINT `FK_paymostly_Maker1` FOREIGN KEY (`Maker`) REFERENCES `person` (`personNo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_paymostly_Permitter2` FOREIGN KEY (`Permitter`) REFERENCES `person` (`personNo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `purchase_allocation_main` */

/*Table structure for table `purchase_enquiry` */

DROP TABLE IF EXISTS `purchase_enquiry`;

CREATE TABLE `purchase_enquiry` (
  `isBillNO` varchar(20) NOT NULL COMMENT '编号',
  `billDate` date NOT NULL COMMENT '单据日期',
  `customerID` int(11) NOT NULL COMMENT '供应商编号--外键',
  `address` varchar(50) DEFAULT NULL COMMENT '供应商地址',
  `validDate` date NOT NULL COMMENT '有效日期',
  `CurrID` int(11) NOT NULL COMMENT '币别',
  `exchRate` decimal(9,2) NOT NULL COMMENT '汇率',
  `priceOfTax` int(11) NOT NULL COMMENT '单价是否含税   0：未税   1：含税',
  `salesID` varchar(50) NOT NULL COMMENT '采购人员编号--外键',
  `departID` int(11) NOT NULL COMMENT '采购人员部门',
  `makerID` varchar(20) NOT NULL COMMENT '制单人员--当前用户',
  `permitterID` varchar(20) NOT NULL COMMENT '复核人员--当前用户',
  `permitDate` datetime NOT NULL COMMENT '复核时间',
  `examine` int(11) NOT NULL COMMENT '审核状态',
  `Remark` varchar(200) NOT NULL COMMENT '备注',
  PRIMARY KEY (`isBillNO`),
  KEY `customerID` (`customerID`),
  KEY `salesID` (`salesID`),
  CONSTRAINT `purchase_enquiry_ibfk_1` FOREIGN KEY (`customerID`) REFERENCES `suppliercategory` (`ClassID`),
  CONSTRAINT `purchase_enquiry_ibfk_2` FOREIGN KEY (`salesID`) REFERENCES `person` (`personNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `purchase_enquiry` */

/*Table structure for table `purchase_enquiry_detail` */

DROP TABLE IF EXISTS `purchase_enquiry_detail`;

CREATE TABLE `purchase_enquiry_detail` (
  `isBillNO` varchar(20) NOT NULL COMMENT '单据编号，主键,外键----主表的',
  `lineID` int(11) DEFAULT NULL COMMENT '行号主键',
  `prodID` varchar(50) DEFAULT NULL COMMENT '物料编号--外键',
  `isdNum` int(11) NOT NULL COMMENT '数量',
  `price` decimal(9,2) NOT NULL COMMENT '单价',
  `amount` decimal(9,2) NOT NULL COMMENT '金额',
  `discount` decimal(9,2) NOT NULL COMMENT '折数',
  `oldPrice` decimal(9,2) NOT NULL COMMENT '折扣前单价',
  `taxRate` decimal(9,2) NOT NULL COMMENT '税率',
  `taxAmtc` decimal(9,2) NOT NULL COMMENT '税额',
  `vfTotal` decimal(9,2) NOT NULL COMMENT '含税金额',
  `isGift` int(11) NOT NULL COMMENT '赠品  0:否   1：是',
  `itemRemark` varchar(200) DEFAULT NULL COMMENT '分录备注',
  `tranType` varchar(20) DEFAULT NULL COMMENT '来源单别',
  `fromNO` varchar(20) DEFAULT NULL COMMENT '来源单号',
  PRIMARY KEY (`isBillNO`),
  KEY `prodID` (`prodID`),
  CONSTRAINT `purchase_enquiry_detail_ibfk_1` FOREIGN KEY (`isBillNO`) REFERENCES `purchase_enquiry` (`isBillNO`),
  CONSTRAINT `purchase_enquiry_detail_ibfk_2` FOREIGN KEY (`prodID`) REFERENCES `wuliaotable` (`WuLiao_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `purchase_enquiry_detail` */

/*Table structure for table `purchase_request` */

DROP TABLE IF EXISTS `purchase_request`;

CREATE TABLE `purchase_request` (
  `BillNo` varchar(50) NOT NULL COMMENT '批号单号',
  `BillDate` date NOT NULL COMMENT '批号行号',
  `ClassId` varchar(11) NOT NULL COMMENT '采购请购类型',
  `BillStatus` int(11) NOT NULL COMMENT '单况状态',
  `SalesId` varchar(50) NOT NULL COMMENT '请购人员id',
  `DepartName` varchar(50) NOT NULL COMMENT '请购部门名称',
  `MakerId` varchar(50) NOT NULL COMMENT '制单人员id',
  `PermitterId` varchar(50) DEFAULT NULL COMMENT '复核人员id',
  `PermitDate` date DEFAULT NULL COMMENT '复核时间  ',
  `Examine` int(11) DEFAULT NULL COMMENT '审核状态',
  `Remaker` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`BillNo`),
  KEY `fk_request_class` (`ClassId`),
  KEY `fk_person_request` (`SalesId`),
  KEY `fk_person_request2` (`MakerId`),
  KEY `fk_person_request3` (`PermitterId`),
  CONSTRAINT `fk_person_request3` FOREIGN KEY (`PermitterId`) REFERENCES `person` (`personNo`),
  CONSTRAINT `fk_person_request` FOREIGN KEY (`SalesId`) REFERENCES `person` (`personNo`),
  CONSTRAINT `fk_person_request2` FOREIGN KEY (`MakerId`) REFERENCES `person` (`personNo`),
  CONSTRAINT `fk_request_class` FOREIGN KEY (`ClassId`) REFERENCES `purchase_request_class` (`ClassId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `purchase_request` */

/*Table structure for table `purchase_request_class` */

DROP TABLE IF EXISTS `purchase_request_class`;

CREATE TABLE `purchase_request_class` (
  `ClassId` varchar(50) NOT NULL COMMENT '采购请购类型编号',
  `ClassName` varchar(50) NOT NULL COMMENT '采购类型名称',
  `EngName` varchar(50) DEFAULT NULL COMMENT '英文名称',
  `Memo` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`ClassId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `purchase_request_class` */

/*Table structure for table `purchase_request_detail` */

DROP TABLE IF EXISTS `purchase_request_detail`;

CREATE TABLE `purchase_request_detail` (
  `BillNo` varchar(50) NOT NULL COMMENT '单据号码',
  `RowNo` int(11) NOT NULL COMMENT '行号',
  `ProdId` varchar(50) NOT NULL COMMENT '物料编号',
  `SQuanTity` int(11) NOT NULL COMMENT '采购数量',
  `Currency` varchar(50) NOT NULL COMMENT '币别',
  `StdPrice` double NOT NULL COMMENT '标准进价',
  `Amount` double NOT NULL COMMENT '标准进价金额',
  `PreInDate` date NOT NULL COMMENT '需求日期',
  `SuggestPurDate` date NOT NULL COMMENT '建议采购日期  ',
  `QtyRemain` int(11) NOT NULL COMMENT '未采购数量',
  `IntemRemark` varchar(500) DEFAULT NULL COMMENT '分录备注',
  `FromNo` varchar(50) DEFAULT NULL COMMENT '来源单号',
  `TranType` varchar(50) DEFAULT NULL COMMENT '来源单别',
  PRIMARY KEY (`BillNo`,`RowNo`),
  KEY `fk_WuLiaoTable_detail` (`ProdId`),
  KEY `fk_order_detail` (`FromNo`),
  KEY `fk_order_detail41465` (`TranType`),
  CONSTRAINT `fk_order_detail41465` FOREIGN KEY (`TranType`) REFERENCES `bill_type` (`billTypeName`),
  CONSTRAINT `fk_order_detail` FOREIGN KEY (`FromNo`) REFERENCES `sales_order` (`XsBillno`),
  CONSTRAINT `fk_request_detail` FOREIGN KEY (`BillNo`) REFERENCES `purchase_request` (`BillNo`),
  CONSTRAINT `fk_WuLiaoTable_detail` FOREIGN KEY (`ProdId`) REFERENCES `wuliaotable` (`WuLiao_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `purchase_request_detail` */

/*Table structure for table `purchase_storage` */

DROP TABLE IF EXISTS `purchase_storage`;

CREATE TABLE `purchase_storage` (
  `billNo` varchar(50) NOT NULL COMMENT '单据号码',
  `billDate` date NOT NULL COMMENT '单据日期',
  `supplierId` varchar(50) NOT NULL COMMENT '供应商编号',
  `exchangeRate` double DEFAULT '1' COMMENT '汇率',
  `psType` varchar(50) DEFAULT NULL COMMENT '采购入库类型',
  `currency` varchar(50) DEFAULT 'RMB' COMMENT '币别',
  `tax` int(11) DEFAULT '0' COMMENT '单价是否含税   0：未税   1：含税',
  `foreignTrade` int(11) DEFAULT '0' COMMENT '是否是国外贸易 0：否 1：是',
  `voucherNo` varchar(50) DEFAULT NULL COMMENT '凭证编号',
  `makerID` varchar(50) DEFAULT NULL COMMENT '制单人员(Person表)',
  `buyerID` varchar(50) NOT NULL COMMENT '采购人员(Person表)',
  `reviewerID` varchar(50) DEFAULT NULL COMMENT '审核人员(Person表)',
  `createDate` date DEFAULT NULL COMMENT '订单创建时间',
  `checkDate` date DEFAULT NULL COMMENT '审核时间',
  `examine` int(11) DEFAULT '0' COMMENT '审核状态(0未，1已)',
  `wareId` varchar(50) NOT NULL COMMENT '仓库ID',
  `payDay` int(11) DEFAULT NULL COMMENT '付款天数',
  `note` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`billNo`),
  KEY `fk_p13` (`makerID`),
  KEY `fk_p22` (`buyerID`),
  KEY `fk_p31` (`reviewerID`),
  CONSTRAINT `fk_p31` FOREIGN KEY (`reviewerID`) REFERENCES `person` (`personNo`),
  CONSTRAINT `fk_p1` FOREIGN KEY (`makerID`) REFERENCES `person` (`personNo`),
  CONSTRAINT `fk_p13` FOREIGN KEY (`makerID`) REFERENCES `person` (`personNo`),
  CONSTRAINT `fk_p2` FOREIGN KEY (`buyerID`) REFERENCES `person` (`personNo`),
  CONSTRAINT `fk_p22` FOREIGN KEY (`buyerID`) REFERENCES `person` (`personNo`),
  CONSTRAINT `fk_p3` FOREIGN KEY (`reviewerID`) REFERENCES `person` (`personNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `purchase_storage` */

/*Table structure for table `purchase_storage_detail` */

DROP TABLE IF EXISTS `purchase_storage_detail`;

CREATE TABLE `purchase_storage_detail` (
  `billNo` varchar(50) NOT NULL COMMENT '单据号码',
  `lineId` int(11) NOT NULL COMMENT '行号',
  `partNo` varchar(50) NOT NULL COMMENT '物料编号',
  `nums` int(11) DEFAULT NULL COMMENT '数量',
  `price` double DEFAULT NULL COMMENT '单价',
  `taxrate` double DEFAULT NULL COMMENT '税率',
  `taxprice` double DEFAULT NULL COMMENT '税额',
  `taxamount` double DEFAULT NULL COMMENT '含税金额',
  `sumprice` double DEFAULT NULL COMMENT '金额',
  `discount` double DEFAULT NULL COMMENT '折数',
  `discountprice` double DEFAULT NULL COMMENT '折扣前单价',
  PRIMARY KEY (`billNo`,`lineId`),
  KEY `fk_wlbh` (`partNo`),
  CONSTRAINT `fk_wlbh` FOREIGN KEY (`partNo`) REFERENCES `wuliaotable` (`WuLiao_ID`),
  CONSTRAINT `fk_cgrkbh` FOREIGN KEY (`billNo`) REFERENCES `purchase_storage` (`billNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `purchase_storage_detail` */

/*Table structure for table `purchasereturn_bill` */

DROP TABLE IF EXISTS `purchasereturn_bill`;

CREATE TABLE `purchasereturn_bill` (
  `BillNo` varchar(50) NOT NULL COMMENT '单据编号',
  `Supplier_Id` varchar(50) NOT NULL COMMENT '供应商ID',
  `BillDate` date NOT NULL COMMENT '单据日期',
  `PriceOfTax` int(50) NOT NULL COMMENT '单据是否含税',
  `Currency` varchar(50) DEFAULT NULL COMMENT '币别',
  `Warehouse` varchar(50) NOT NULL COMMENT '仓库',
  `Exchrate` double DEFAULT '1' COMMENT '汇率',
  `Restocking` int(11) NOT NULL COMMENT '重新入库',
  `SalesName` varchar(50) NOT NULL COMMENT '采购人员',
  `Maker` varchar(50) NOT NULL COMMENT '制单人员',
  `Permitter` varchar(50) DEFAULT NULL COMMENT '复核人员',
  `DepartName` varchar(50) NOT NULL COMMENT '所属部门',
  `ReviewTime` date DEFAULT NULL COMMENT '复核时间',
  `ReviewStatus` int(11) DEFAULT NULL COMMENT '复核状态',
  PRIMARY KEY (`BillNo`),
  KEY `fk_d4` (`Supplier_Id`),
  CONSTRAINT `fk_d` FOREIGN KEY (`Supplier_Id`) REFERENCES `supplier` (`SupplierId`),
  CONSTRAINT `fk_d4` FOREIGN KEY (`Supplier_Id`) REFERENCES `supplier` (`SupplierId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `purchasereturn_bill` */

/*Table structure for table `purchasereturn_detail` */

DROP TABLE IF EXISTS `purchasereturn_detail`;

CREATE TABLE `purchasereturn_detail` (
  `Line` int(11) NOT NULL COMMENT '行号',
  `BillNo` varchar(50) NOT NULL COMMENT '单据编号',
  `MaterialNum` varchar(50) NOT NULL COMMENT '物料编号',
  `Num` int(11) NOT NULL COMMENT '数量',
  `OldPrice` double DEFAULT NULL COMMENT '折扣前单价',
  `FoldingNumber` double DEFAULT NULL COMMENT '折数',
  `Price` double NOT NULL COMMENT '单价',
  `AmountMoney` double NOT NULL COMMENT '金额',
  `TaxRate` double NOT NULL COMMENT '税率',
  `TaxAmt` double DEFAULT NULL COMMENT '税额',
  `AmountATax` double DEFAULT NULL COMMENT '含税金额',
  `IsGift` int(11) NOT NULL COMMENT '赠品',
  `ItemRemark` varchar(50) DEFAULT NULL COMMENT '分录备注',
  `FromNO` varchar(50) DEFAULT NULL COMMENT '来源单号',
  `TranType` varchar(50) DEFAULT NULL COMMENT '来源单别',
  PRIMARY KEY (`Line`,`BillNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `purchasereturn_detail` */

/*Table structure for table `resulttable` */

DROP TABLE IF EXISTS `resulttable`;

CREATE TABLE `resulttable` (
  `SerNo` int(11) NOT NULL DEFAULT '0' COMMENT '栏号',
  `Billno` varchar(50) NOT NULL DEFAULT '' COMMENT '主表单据编号',
  `FromNO` varchar(50) DEFAULT NULL COMMENT '采购入库单号',
  `ProdID` varchar(50) DEFAULT NULL COMMENT '物料编号',
  `MLAmount` int(11) DEFAULT NULL COMMENT '分摊金额',
  `Vamount` int(11) DEFAULT NULL COMMENT '采购金额',
  `Vquantity` int(11) DEFAULT NULL COMMENT '数量',
  PRIMARY KEY (`Billno`,`SerNo`),
  KEY `FK_paymostly_FromNO` (`FromNO`),
  KEY `FK_paymostly_ProdID` (`ProdID`),
  CONSTRAINT `FK_paymostly_FromNO` FOREIGN KEY (`FromNO`) REFERENCES `wuliaotable` (`WuLiao_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_paymostly_ProdID` FOREIGN KEY (`ProdID`) REFERENCES `purchase_storage` (`billNo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `resulttable` */

/*Table structure for table `sales_order` */

DROP TABLE IF EXISTS `sales_order`;

CREATE TABLE `sales_order` (
  `XsBillno` varchar(50) NOT NULL,
  `Billdate` date DEFAULT NULL,
  `CustBillNo` varchar(50) NOT NULL,
  `BillStyleID` int(11) DEFAULT NULL,
  `BillStyleName` varchar(50) DEFAULT NULL,
  `CusttomerID` varchar(50) NOT NULL,
  `Delivery_address` varchar(50) NOT NULL,
  `PriceOfTax` int(11) NOT NULL,
  `CurrID` int(11) NOT NULL,
  `Maker` varchar(50) NOT NULL,
  `Permitter` varchar(50) DEFAULT NULL,
  `Remark` varchar(200) DEFAULT NULL,
  `BillStatus` int(11) NOT NULL,
  `SalesID` varchar(50) NOT NULL,
  `PsnIdentityNumber` varchar(50) NOT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`XsBillno`),
  KEY `FK_sales_order` (`CusttomerID`),
  KEY `FK_sales_order1` (`CurrID`),
  KEY `FK_sales_order333` (`SalesID`),
  KEY `FK_sales_order5444` (`PsnIdentityNumber`),
  CONSTRAINT `FK_sales_order5444` FOREIGN KEY (`PsnIdentityNumber`) REFERENCES `dept` (`deptID`),
  CONSTRAINT `FK_sales_order` FOREIGN KEY (`CusttomerID`) REFERENCES `customer_data` (`KID`),
  CONSTRAINT `FK_sales_order1` FOREIGN KEY (`CurrID`) REFERENCES `curr` (`CurrID`),
  CONSTRAINT `FK_sales_order333` FOREIGN KEY (`SalesID`) REFERENCES `person` (`personNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sales_order` */

/*Table structure for table `supplier` */

DROP TABLE IF EXISTS `supplier`;

CREATE TABLE `supplier` (
  `SupplierId` varchar(50) NOT NULL COMMENT '供应商编号',
  `FullName` varchar(50) NOT NULL COMMENT '供应商全称',
  `ShortName` varchar(50) DEFAULT NULL COMMENT '供应商简称',
  `SupplierAddress` varchar(50) DEFAULT NULL COMMENT '供应商地址',
  `Remark` varchar(50) DEFAULT NULL COMMENT '备注',
  `CurAdvRecv` double NOT NULL DEFAULT '0' COMMENT '期末预付款',
  `CurReceivable` double NOT NULL DEFAULT '0' COMMENT '期末应付款',
  `StartAdvRecv` double NOT NULL DEFAULT '0' COMMENT '期初预付款',
  `StartReceivable` double NOT NULL DEFAULT '0' COMMENT '期初应付款',
  `AmountQuota` double NOT NULL DEFAULT '0' COMMENT '账款额度',
  `RemainQuota` double NOT NULL DEFAULT '0' COMMENT '账款剩余额度',
  PRIMARY KEY (`SupplierId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `supplier` */

/*Table structure for table `supplier_details` */

DROP TABLE IF EXISTS `supplier_details`;

CREATE TABLE `supplier_details` (
  `DetailsId` int(11) NOT NULL COMMENT '账款明细编号',
  `SupplierId` varchar(50) NOT NULL COMMENT '供应商编号',
  `Origin` varchar(50) NOT NULL COMMENT '单据类型',
  `BillNo` varchar(50) DEFAULT NULL COMMENT '单号',
  `SupplierDate` datetime DEFAULT NULL COMMENT '日期',
  `OriginalAmount` double DEFAULT NULL COMMENT '原单金额',
  `RemainAmount` double DEFAULT NULL COMMENT '现行余额',
  PRIMARY KEY (`DetailsId`),
  KEY `fk_a1` (`SupplierId`),
  CONSTRAINT `fk_a1` FOREIGN KEY (`SupplierId`) REFERENCES `supplier` (`SupplierId`),
  CONSTRAINT `fk_a` FOREIGN KEY (`SupplierId`) REFERENCES `supplier` (`SupplierId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `supplier_details` */

/*Table structure for table `suppliercategory` */

DROP TABLE IF EXISTS `suppliercategory`;

CREATE TABLE `suppliercategory` (
  `ClassID` int(11) NOT NULL COMMENT '类别编号',
  `ClassName` int(11) DEFAULT NULL COMMENT '类别名称',
  `EngName` int(11) DEFAULT NULL COMMENT '英文名称',
  `Memo` int(11) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`ClassID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `suppliercategory` */

/*Table structure for table `takeadvancelist` */

DROP TABLE IF EXISTS `takeadvancelist`;

CREATE TABLE `takeadvancelist` (
  `fundbillid` varchar(50) NOT NULL DEFAULT '' COMMENT '预付单单号',
  `sourcetype` varchar(50) DEFAULT NULL COMMENT '来源别',
  `sourcebill` varchar(50) DEFAULT NULL COMMENT '来源订单单号',
  `prepaybalance` double DEFAULT NULL COMMENT '来源预付行号',
  `takeimprest` double DEFAULT NULL COMMENT '取用预付金额',
  PRIMARY KEY (`fundbillid`),
  CONSTRAINT `FK_takeadvancelist_fundbillid` FOREIGN KEY (`fundbillid`) REFERENCES `paymostly` (`fundbillid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `takeadvancelist` */

/*Table structure for table `wuliaocompany` */

DROP TABLE IF EXISTS `wuliaocompany`;

CREATE TABLE `wuliaocompany` (
  `WLcom_ID` int(11) NOT NULL AUTO_INCREMENT,
  `WLcom_name` varchar(20) NOT NULL,
  `WLcom_Remarks` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`WLcom_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `wuliaocompany` */

/*Table structure for table `wuliaotable` */

DROP TABLE IF EXISTS `wuliaotable`;

CREATE TABLE `wuliaotable` (
  `WuLiao_ID` varchar(50) NOT NULL,
  `WuLiao_Name` varchar(50) NOT NULL,
  `WuLiao_typeid` varchar(20) NOT NULL,
  `WuLiao_lunit` int(11) NOT NULL,
  `WuLiao_Xinhao` varchar(20) DEFAULT NULL,
  `WuLiao_price` decimal(9,2) DEFAULT NULL,
  `WuLiao_PriceA` decimal(9,2) DEFAULT NULL,
  `WuLiao_PriceB` decimal(9,2) DEFAULT NULL,
  `WuLiao_Bibie` int(11) NOT NULL,
  `WuLiao_form` varchar(20) NOT NULL,
  `WuLiao_Hanshui` int(11) NOT NULL,
  `WuLiao_Shuilv` decimal(10,0) NOT NULL,
  `WuLiao_TiQiandate` int(11) DEFAULT NULL,
  `WuLiao_Supplier` varchar(20) DEFAULT NULL,
  `WuLiao_Biaoprice` decimal(9,2) NOT NULL,
  `WuLiao_Miaoshu` varchar(500) DEFAULT NULL,
  `WuLiao_Avgcost` decimal(9,2) NOT NULL,
  `WuLiao_XianAvgcost` decimal(9,2) NOT NULL,
  `WuLiao_Biaocost` decimal(9,2) NOT NULL,
  `WuLiao_QiTotalcost` decimal(9,2) NOT NULL,
  `WuLiao_XianTotalcost` decimal(9,2) NOT NULL,
  `WuLiao_Totalcost` decimal(9,2) NOT NULL,
  `WuLiao_Recentdate` date DEFAULT NULL,
  `WuLiao_Storagedate` date DEFAULT NULL,
  PRIMARY KEY (`WuLiao_ID`),
  KEY `WuLiao_typeid_top1` (`WuLiao_typeid`),
  KEY `WuLiao_lunit_top2` (`WuLiao_lunit`),
  KEY `WuLiao_Bibie_top3` (`WuLiao_Bibie`),
  KEY `WuLiao_Supplier_top4` (`WuLiao_Supplier`),
  CONSTRAINT `WuLiao_Supplier_top4` FOREIGN KEY (`WuLiao_Supplier`) REFERENCES `supplier` (`SupplierId`),
  CONSTRAINT `WuLiao_Bibie_top3` FOREIGN KEY (`WuLiao_Bibie`) REFERENCES `curr` (`CurrID`),
  CONSTRAINT `WuLiao_lunit_top2` FOREIGN KEY (`WuLiao_lunit`) REFERENCES `wuliaocompany` (`WLcom_ID`),
  CONSTRAINT `WuLiao_typeid_top1` FOREIGN KEY (`WuLiao_typeid`) REFERENCES `wuliaotype` (`WL_typeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `wuliaotable` */

/*Table structure for table `wuliaotype` */

DROP TABLE IF EXISTS `wuliaotype`;

CREATE TABLE `wuliaotype` (
  `WL_typeid` varchar(20) NOT NULL,
  `WL_typename` varchar(20) NOT NULL,
  `WL_Remarks` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`WL_typeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `wuliaotype` */

/*Table structure for table `xiaoshou_detail` */

DROP TABLE IF EXISTS `xiaoshou_detail`;

CREATE TABLE `xiaoshou_detail` (
  `XsDetail_Line` int(11) NOT NULL,
  `XsDetail_WuliaoID` varchar(50) NOT NULL,
  `XsDetail_WuliaoName` varchar(50) NOT NULL,
  `XsDetaiz_DanjuID` varchar(20) NOT NULL,
  `XsDetail_Count` int(11) NOT NULL,
  `XsDetail_Zhekouprice` float(18,2) NOT NULL,
  `XsDetail_ZheShu` decimal(9,2) NOT NULL,
  `XsDetail_price` decimal(9,2) NOT NULL,
  `XsDetail_money` decimal(9,2) NOT NULL,
  `XsDetail_taxrate` decimal(9,2) NOT NULL,
  `XsDetail_Taxamount` decimal(9,2) NOT NULL,
  `XsDetail_Taxmoney` decimal(9,2) NOT NULL,
  `XsDetail_gift` int(11) DEFAULT NULL,
  `XsDetail_Remarks` varchar(500) DEFAULT NULL,
  `XsDetail_SourceList` varchar(20) NOT NULL,
  `XsDetail_SourceNo` varchar(20) NOT NULL,
  `XsDetail_CustomerOrder` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`XsDetail_Line`,`XsDetaiz_DanjuID`),
  KEY `XsDetail_WuliaoID_top1` (`XsDetail_WuliaoID`),
  KEY `XsDetaiz_DanjuID_top2` (`XsDetaiz_DanjuID`),
  CONSTRAINT `XsDetaiz_DanjuID_top2` FOREIGN KEY (`XsDetaiz_DanjuID`) REFERENCES `xiaoshoutable` (`Xs_DanjuID`),
  CONSTRAINT `XsDetail_WuliaoID_top1` FOREIGN KEY (`XsDetail_WuliaoID`) REFERENCES `wuliaotable` (`WuLiao_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xiaoshou_detail` */

/*Table structure for table `xiaoshoutable` */

DROP TABLE IF EXISTS `xiaoshoutable`;

CREATE TABLE `xiaoshoutable` (
  `Xs_DanjuID` varchar(20) NOT NULL,
  `Xs_KeHuID` varchar(20) NOT NULL,
  `Xs_DanjuDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Xs_Address` varchar(50) DEFAULT NULL,
  `Xs_CangKu` varchar(20) NOT NULL,
  `Xs_Bibie` int(20) NOT NULL,
  `Xs_HanShui` int(11) NOT NULL,
  `Xs_Huilv` decimal(10,0) DEFAULT NULL,
  `Xs_ChukuClass` varchar(20) DEFAULT NULL,
  `Xs_YeWuRenYuan` varchar(20) NOT NULL,
  `Xs_makerID` varchar(20) DEFAULT NULL,
  `Xs_Departments` varchar(20) NOT NULL,
  `Xs_buyerID` varchar(20) DEFAULT NULL,
  `Xs_ShenheDate` date DEFAULT NULL,
  `Xs_ShenheStater` int(11) DEFAULT NULL,
  `Xs_Remarks` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`Xs_DanjuID`),
  KEY `Xs_KeHuID_top1` (`Xs_KeHuID`),
  KEY `Xs_Departments_top4` (`Xs_CangKu`),
  KEY `Xs_Bibie_top2` (`Xs_Bibie`),
  CONSTRAINT `Xs_Bibie_top2` FOREIGN KEY (`Xs_Bibie`) REFERENCES `curr` (`CurrID`),
  CONSTRAINT `Xs_CangKu_top3` FOREIGN KEY (`Xs_CangKu`) REFERENCES `cangku` (`whID`),
  CONSTRAINT `Xs_Departments_top4` FOREIGN KEY (`Xs_CangKu`) REFERENCES `dept` (`deptID`),
  CONSTRAINT `Xs_KeHuID_top1` FOREIGN KEY (`Xs_KeHuID`) REFERENCES `customer_data` (`KID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xiaoshoutable` */

/*Table structure for table `xiaoshouthmax` */

DROP TABLE IF EXISTS `xiaoshouthmax`;

CREATE TABLE `xiaoshouthmax` (
  `BillNo` varchar(50) NOT NULL COMMENT '单据号码',
  `CustID` varchar(50) DEFAULT NULL COMMENT '客户',
  `Billdate` date DEFAULT NULL COMMENT '单据日期',
  `CustAddress` varchar(50) DEFAULT NULL COMMENT '送货地址',
  `PriceofTax` int(11) DEFAULT NULL COMMENT '是否含税',
  `WareID` int(11) DEFAULT NULL COMMENT '仓库ID',
  `IsDeduct` int(11) DEFAULT NULL COMMENT '重新出库',
  `SalesName` varchar(50) DEFAULT NULL COMMENT '业务人员',
  `Maker` varchar(50) DEFAULT NULL COMMENT '制单人员',
  `DepartName` varchar(50) DEFAULT NULL COMMENT '所属部门',
  `Permitter` varchar(50) DEFAULT NULL COMMENT '复核人员',
  `CurName` varchar(50) DEFAULT NULL COMMENT '币别',
  PRIMARY KEY (`BillNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xiaoshouthmax` */

/*Table structure for table `xiaoshouthmx` */

DROP TABLE IF EXISTS `xiaoshouthmx`;

CREATE TABLE `xiaoshouthmx` (
  `LineNumber` int(11) NOT NULL COMMENT '行号',
  `BillNo` varchar(50) NOT NULL COMMENT '单据号码',
  `MarterialNumberID` varchar(50) DEFAULT NULL COMMENT '物料编号',
  `Num` int(11) DEFAULT NULL COMMENT '数量',
  `OlderPrice` double DEFAULT NULL COMMENT '折扣前单价',
  `FoldingName` double DEFAULT NULL COMMENT '折数',
  `UnitPrice` double DEFAULT NULL COMMENT '单价',
  `AmountMoney` double DEFAULT NULL COMMENT '金额',
  `TaxRate` double DEFAULT NULL COMMENT '税率',
  `TaxAmt` double DEFAULT NULL COMMENT '税额',
  `AmountATax` double DEFAULT NULL COMMENT '含税金额',
  `IsGift` int(11) DEFAULT NULL COMMENT '赠品',
  `ItemRemark` varchar(50) DEFAULT NULL COMMENT '分录备注',
  `FromNo` varchar(50) DEFAULT NULL COMMENT '来源单号',
  PRIMARY KEY (`LineNumber`,`BillNo`),
  KEY `fk_gys1` (`BillNo`),
  CONSTRAINT `fk_gys1` FOREIGN KEY (`BillNo`) REFERENCES `xiaoshouthmax` (`BillNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xiaoshouthmx` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
