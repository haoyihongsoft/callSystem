SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_area
-- ----------------------------
DROP TABLE IF EXISTS `t_area`;
CREATE TABLE `t_area`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分区主键id',
  `visaCode` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '签证中心',
  `code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '区域编号',
  `zh` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '中文名称',
  `native` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '本地名称',
  `yn` int(2) NOT NULL COMMENT '是否有效 1有效 0无效',
  `created` datetime NOT NULL COMMENT '创建时间',
  `updated` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '分区表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_callMachine
-- ----------------------------
DROP TABLE IF EXISTS `t_callMachine`;
CREATE TABLE `t_callMachine`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '取号机主键',
  `visaCode` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '签证中心',
  `code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '取号机编号',
  `ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '取号机ip地址',
  `yn` int(2) NOT NULL COMMENT '是否有效 1有效 0无效',
  `created` datetime NOT NULL COMMENT '创建时间',
  `updated` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '取号机' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_prop
-- ----------------------------
DROP TABLE IF EXISTS `t_prop`;
CREATE TABLE `t_prop`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '队列属性主键',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '属性名称',
  `yn` int(2) NULL DEFAULT NULL COMMENT '是否有效 1有效 0无效',
  `created` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updated` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '属性表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_propQueue
-- ----------------------------
DROP TABLE IF EXISTS `t_propQueue`;
CREATE TABLE `t_propQueue`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '属性-队列关联表',
  `propId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '属性id',
  `propValueId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '属性值id',
  `queueId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '队列id',
  `yn` int(2) NULL DEFAULT NULL COMMENT '是否有效 1有效 0无效',
  `created` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updated` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '属性-队列关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_propValue
-- ----------------------------
DROP TABLE IF EXISTS `t_propValue`;
CREATE TABLE `t_propValue`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '属性值主键',
  `propId` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '属性id',
  `value` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '属性值',
  `yn` int(2) NULL DEFAULT NULL COMMENT '是否有效 1有效 0无效',
  `created` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updated` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '属性值表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_queue
-- ----------------------------
DROP TABLE IF EXISTS `t_queue`;
CREATE TABLE `t_queue`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '队列表主键id',
  `visaCode` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '签证中心',
  `visaCenterBumodel` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '签证中心业务模式',
  `bizType` int(2) NOT NULL COMMENT '业务类型 1签证 2认证',
  `vip` int(2) NOT NULL COMMENT '服务类型 1VIP 0普通',
  `queueType` int(2) NOT NULL COMMENT '队列类型 1接案 2生物采集 3收费 4发证',
  `shortName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '简称',
  `allName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '全称',
  `queueNameRemark` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '队列编号',
  `repeat` int(2) NOT NULL COMMENT '重复叫号次数',
  `waitArea` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '等待区id',
  `prefix` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '队列前缀',
  `start` bigint(20) NOT NULL COMMENT '开始号码',
  `end` bigint(20) NOT NULL COMMENT '截止号码',
  `beforeType` int(2) NOT NULL COMMENT '号码发放提前方式',
  `beforeTime` int(2) NOT NULL COMMENT '号码发放提前时间  单位分钟',
  `computeType` int(2) NOT NULL COMMENT '等待时间计算方式  1当排号生成时开始计算 2当队列开始时开始计算',
  `workStart` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '工作开始时间',
  `queueStart` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '队列服务开始时间',
  `queueEnd` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '队列服务结束时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '队列表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_screenMachine
-- ----------------------------
DROP TABLE IF EXISTS `t_screenMachine`;
CREATE TABLE `t_screenMachine`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '大屏主键id',
  `visaCode` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '签证中心',
  `code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '大屏编号',
  `ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '大屏设备ip',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '大屏表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_screenQueue
-- ----------------------------
DROP TABLE IF EXISTS `t_screenQueue`;
CREATE TABLE `t_screenQueue`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '大屏分组主键id',
  `visaCode` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '签证中心',
  `screenId` bigint(64) NOT NULL COMMENT '大屏表主键id',
  `groupCode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分组编号',
  `groupName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分组名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '大屏-队列关联主表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_screenQueueItem
-- ----------------------------
DROP TABLE IF EXISTS `t_screenQueueItem`;
CREATE TABLE `t_screenQueueItem`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '大屏队列明细主键id',
  `bindId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '大屏队列绑定主表id',
  `queueId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '队列表id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '大屏-队列关联子表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_take
-- ----------------------------
DROP TABLE IF EXISTS `t_take`;
CREATE TABLE `t_take`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '取号表id',
  `visaCode` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '签证中心编号',
  `prepare` int(2) NOT NULL COMMENT '预约类型 1预约 0未预约',
  `bizType` int(2) NOT NULL COMMENT '业务类型 1签证 2认证',
  `applyType` int(2) NOT NULL COMMENT '申请人类型  1个人  2旅行社',
  `vip` int(2) NOT NULL COMMENT '服务类型 1VIP 0普通',
  `queueId` bigint(64) NOT NULL COMMENT '队列id',
  `sn` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Serial Number排号编码',
  `day` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '当前日期  yyyy-MM-dd',
  `windowId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被叫窗口',
  `total` int(2) NOT NULL COMMENT '被叫号次数',
  `status` int(2) NOT NULL COMMENT '排号状态 1等待中 2处理中 3处理完成 4处理中断 5已过号 6作废',
  `created` datetime NOT NULL COMMENT '创建日期',
  `updated` datetime NOT NULL COMMENT '更新日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '取叫号主表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_takeItem
-- ----------------------------
DROP TABLE IF EXISTS `t_takeItem`;
CREATE TABLE `t_takeItem`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '取叫号子表主键',
  `takeId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '取号主表id',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '申请人姓名',
  `commonCode` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '预约单号、护照号、缴费单号等',
  `codeType` int(2) NULL DEFAULT NULL COMMENT '单号类型 1预约单 2护照 3缴费单',
  `yn` int(2) NOT NULL COMMENT '状态 1有效 0无效',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '取叫号子表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_window
-- ----------------------------
DROP TABLE IF EXISTS `t_window`;
CREATE TABLE `t_window`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '服务窗口id主键',
  `visaCode` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '签证中心',
  `areaId` bigint(64) NOT NULL COMMENT '区域表id',
  `code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '窗口编号',
  `number` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '窗口号',
  `ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ip地址',
  `yn` int(2) NOT NULL COMMENT '是否有效 1有效 0无效',
  `created` datetime NOT NULL COMMENT '创建时间',
  `updated` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '窗口表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_windowQueue
-- ----------------------------
DROP TABLE IF EXISTS `t_windowQueue`;
CREATE TABLE `t_windowQueue`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '窗口绑定队列主键id',
  `visaCode` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '签证中心',
  `windowId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '窗口id',
  `type` int(2) NOT NULL COMMENT '是否一站式 1是 0否',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '窗口-队列关联主表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_windowQueueItem
-- ----------------------------
DROP TABLE IF EXISTS `t_windowQueueItem`;
CREATE TABLE `t_windowQueueItem`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '窗口绑定队列明细表主键id',
  `bindId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '绑定窗口主表id',
  `queueId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '队列id',
  `num` int(2) NOT NULL COMMENT '优先顺序号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '窗口-队列关联子表' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
