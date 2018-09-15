/*
Navicat MySQL Data Transfer

Source Server         : db_web
Source Server Version : 50714
Source Host           : localhost:3306
Source Database       : bimaistore

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2017-06-28 17:37:02
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(32) DEFAULT NULL,
  `admin_pwd` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', '123');
INSERT INTO `admin` VALUES ('2', 'lgx', '123');
INSERT INTO `admin` VALUES ('3', 'asd', '789');

-- ----------------------------
-- Table structure for `category`
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `cid` varchar(32) NOT NULL,
  `cname` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '贵金属首饰');
INSERT INTO `category` VALUES ('2', '高端化妆品');
INSERT INTO `category` VALUES ('59FDCCC039EE489A8BDC4D88A9A1C468', '太阳镜');
INSERT INTO `category` VALUES ('7871B30DE0834587AE8DC0004D6AD71F', '名牌包包\n');
INSERT INTO `category` VALUES ('7AC81023B9A14D17AE6E717CCB96100C', '衣服\n');
INSERT INTO `category` VALUES ('8EE24DFEFAE54EDFAB13E49994F644DE', '顶级手表');
INSERT INTO `category` VALUES ('F7C8C1DC5FD04FA880189BD5F94CBC92', '鞋');

-- ----------------------------
-- Table structure for `notice`
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `ntitle` varchar(526) DEFAULT NULL,
  `ndesc` varchar(1024) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `ndate` datetime DEFAULT NULL,
  PRIMARY KEY (`nid`),
  KEY `admin_id` (`admin_id`),
  CONSTRAINT `notice_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3293 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES ('3276', '最新男鞋打折啦', '哈哈哈哈哈', '1', '2017-06-26 17:00:06');
INSERT INTO `notice` VALUES ('3277', 'Test1111', 'ashjkahskjdvbksjdklbsdjbsljdvslvbd', '1', '2017-06-26 17:00:38');
INSERT INTO `notice` VALUES ('3278', 'Test54894', '的女流开始了是但是绝对深刻数据', '1', '2017-06-26 17:00:55');
INSERT INTO `notice` VALUES ('3279', '皮革厂倒闭了', 'LV皮革厂倒闭了，老板带着钱跑路了。原价20000多的包，现在只要9998！！！', '1', '2017-06-26 17:07:48');
INSERT INTO `notice` VALUES ('3280', '6.18 !6.18 !6.18!', '疯狂降价，史上最低。', '1', '2017-06-26 17:29:44');
INSERT INTO `notice` VALUES ('3281', 'zhangjiaxin', 'zhangjiaxinzhangjiaxinzhangjiaxinzhangjiaxin', '1', '2017-06-26 17:30:16');
INSERT INTO `notice` VALUES ('3282', '江南皮革厂重新开业啦 ', '原价100 多 200多的钱包统统20块，统统20块，20块你买不了吃亏，20块你买不了上当，买到就是赚到，心动不如行动！', '1', '2017-06-26 17:32:05');
INSERT INTO `notice` VALUES ('3283', '刘国鑫', '时尚达人！！！！！', '1', '2017-06-26 17:33:21');
INSERT INTO `notice` VALUES ('3284', '普拉达全场2折', '史上最新折扣价，全新的款式，全新的价格。买的舒心，穿的放心！尽在必买网！', '1', '2017-06-26 17:35:21');
INSERT INTO `notice` VALUES ('3285', '张家盺', '最强p图！！！！！', '1', '2017-06-26 17:37:07');
INSERT INTO `notice` VALUES ('3286', '刘文书', '文艺少女！！！！！', '1', '2017-06-26 17:37:18');
INSERT INTO `notice` VALUES ('3287', '孙磊', '文艺青年！！！！！', '1', '2017-06-26 17:37:14');
INSERT INTO `notice` VALUES ('3288', 'admin', 'test', '1', '2017-06-26 18:02:00');
INSERT INTO `notice` VALUES ('3289', '哈哈', '啊实打实大所大多', '2', '2017-06-26 18:02:49');
INSERT INTO `notice` VALUES ('3290', 'test6.28', 'test  test', '1', '2017-06-28 09:04:24');
INSERT INTO `notice` VALUES ('3291', '喜迎6.30！！！', '6.30号，我们等来了这一天，怀着忐忑的心情，欢迎各位的来临，祝您购物愉快！', '1', '2017-06-28 11:33:27');
INSERT INTO `notice` VALUES ('3292', 'test', 'jksafasjfha;sjfb;askjfbaksfn设计费不是打开', '2', '2017-06-28 16:36:40');

-- ----------------------------
-- Table structure for `orderitem`
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem` (
  `itemid` varchar(32) NOT NULL,
  `count` int(11) DEFAULT NULL,
  `subtotal` double DEFAULT NULL,
  `pid` varchar(32) DEFAULT NULL,
  `oid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`itemid`),
  KEY `fk_0001` (`pid`),
  KEY `fk_0002` (`oid`),
  CONSTRAINT `fk_0001` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`),
  CONSTRAINT `fk_0002` FOREIGN KEY (`oid`) REFERENCES `orders` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderitem
-- ----------------------------
INSERT INTO `orderitem` VALUES ('032D372FA1024F3493A4DCA6F655275C', '1', '4206', 'C9A1BEAEB5E949709C10866F246C1AB1', '37AA7427F24C45548D899B67F07CA298');
INSERT INTO `orderitem` VALUES ('0AE721CB2C0C46DB822838A9FBD01408', '1', '770', '307FB7FB2DCC49BA8236EC1D23381307', 'EBC10A01AB6841829E732D64CD0F09E4');
INSERT INTO `orderitem` VALUES ('11C8729F11B4406E9A76EF356354F090', '5', '403300', '31BA10D35A104BCEB7BF6D9A70509A86', '14A5426519F34224B899EF550E2F91F6');
INSERT INTO `orderitem` VALUES ('1C2BF4A93C6148AAB83B505AA7C47A3E', '60', '23400', '201DEBA4ABA54BE6B2681A4886C2810E', 'E538AE522A82414BA028D7EBE83364D7');
INSERT INTO `orderitem` VALUES ('1CBDD0453FE645C79518463C127E806F', '1', '98645', '4688636014904B65AC04DCFAB248FB3F', 'C21197F99B1C4ABBBB8868C082122B0A');
INSERT INTO `orderitem` VALUES ('1EDB58C16EB0457683A37A43F814AAD8', '6', '2270664', '59F11A12F6A04A39BEBCB8B3F3394AF5', '37AA7427F24C45548D899B67F07CA298');
INSERT INTO `orderitem` VALUES ('1F66A9EF2F674F40B9660C128C1E789B', '1', '378444', '59F11A12F6A04A39BEBCB8B3F3394AF5', 'D707AC0C70C9439597A31619FB0141DE');
INSERT INTO `orderitem` VALUES ('1FA91351A93E47A7A6951F294FECDD16', '1', '5669', '309260391B6E4528BEDCD40F16028892', '95835A0DBFCB41609746919E8BFFB05C');
INSERT INTO `orderitem` VALUES ('254723EFBDB6413A85FE37488B803C54', '7', '384083', '7716E8D1B7754755AF0DF6328298B0DB', 'B920C3AD7BA34DE092A4C17BC386591B');
INSERT INTO `orderitem` VALUES ('2D9FDBFA56404467869273F5B101D64E', '1', '5669', '309260391B6E4528BEDCD40F16028892', '245BCE44F4D846AA8213520AAC7E69DA');
INSERT INTO `orderitem` VALUES ('3545D8CE4B3C4F4C82554926559526B5', '1', '98645', '4688636014904B65AC04DCFAB248FB3F', '400C38A61A254D50BE44A389D73BBD8F');
INSERT INTO `orderitem` VALUES ('3B5CAEB4780C4652B9AF1DD0E6FF15F3', '1', '28661', '3401F7E1BC8646D1B3E2D684832653A8', 'EF5EA4FDC00C4F598620DCE3661FA354');
INSERT INTO `orderitem` VALUES ('3D854C0B640C430184E7B29D7D8F47BA', '6', '4197150', '70CF5E0279F04CC38E2FC76FB3C6B461', 'F81D50B533DC4E14BCE94A85F5B94610');
INSERT INTO `orderitem` VALUES ('4096B770C4634F36B749AA09AA7E0D7D', '10', '131400', '3B4E6306826B4E04BE9A2F0057BF559A', '53D78E60BC1B402888D04F01E69328AB');
INSERT INTO `orderitem` VALUES ('44B697D8EE5E4135890942DF051E406E', '1', '376666', 'B2FBE3F120274032B3B851BC1513EBF2', '1F1A36D42B924934A13CFC31982C598D');
INSERT INTO `orderitem` VALUES ('4C1659DB35D945E6BD06818D16523137', '1', '540', '3A1414DA79CD4D9985CA5A82B3B26E5D', 'C21197F99B1C4ABBBB8868C082122B0A');
INSERT INTO `orderitem` VALUES ('533F97C187924EC5BF5C739E683368CE', '60', '22599960', 'B2FBE3F120274032B3B851BC1513EBF2', 'E0E500A66B9043FCBCA3090B905DFFA7');
INSERT INTO `orderitem` VALUES ('5C5E0B20DFB747008C4F2C72B041CA2F', '1', '3566', '33832CF499DD46C4B342623A5F157830', '455BACC584D945AA81CA1F7E09266B94');
INSERT INTO `orderitem` VALUES ('65EEC8FE81D6438B9F64E01ACD304207', '1', '699525', '70CF5E0279F04CC38E2FC76FB3C6B461', '400C38A61A254D50BE44A389D73BBD8F');
INSERT INTO `orderitem` VALUES ('665ABA68B4C04840985F0B4AF800AD66', '1', '28660', '93D6BDCA98C64465B0CAD223A51F2332', '5258DC391759404183B0A465C304205D');
INSERT INTO `orderitem` VALUES ('6916A44379EC4B25902A086DDC71E9A6', '3', '9900', '2E039BB6D02C4B3FB8F67A351DCDC411', '2F5F91D85EE949578529E5ED5C993BB3');
INSERT INTO `orderitem` VALUES ('6F27DE4EBA0F40109F428D4710947D2B', '1', '1210', '19919AB145D24F2BBF67EAB3389080A3', '245BCE44F4D846AA8213520AAC7E69DA');
INSERT INTO `orderitem` VALUES ('74F821D67BC141868C37D9D6C2F2DE71', '1', '300', '17FB09226A1F43C0BC08CA0F08E11B95', '0DEB856C347A48A19682A1CDC4CAFB0C');
INSERT INTO `orderitem` VALUES ('77B4540EEFEC44D8B2AB909FA503867A', '10', '986450', '4688636014904B65AC04DCFAB248FB3F', '225829E7C5324E38B2A670E156AC222C');
INSERT INTO `orderitem` VALUES ('8128583F3B7B4242BA9F909A34BFF22D', '1', '9988', '8708DFDB16814E5BB13FBBAA0A033B0A', '1F1A36D42B924934A13CFC31982C598D');
INSERT INTO `orderitem` VALUES ('86751AD6947E4DB2858EEB6CB1FB9516', '1', '80660', '31BA10D35A104BCEB7BF6D9A70509A86', '0DEB856C347A48A19682A1CDC4CAFB0C');
INSERT INTO `orderitem` VALUES ('88FE37AB31244D0094ECCDCEAE899D68', '19', '7156654', 'B2FBE3F120274032B3B851BC1513EBF2', 'D707AC0C70C9439597A31619FB0141DE');
INSERT INTO `orderitem` VALUES ('8D4420D862A8428B9A72FB33D3FA2561', '1', '98645', '4688636014904B65AC04DCFAB248FB3F', '1F1A36D42B924934A13CFC31982C598D');
INSERT INTO `orderitem` VALUES ('8DAFA40A75AE44EFB98EACC7CEB8BEE3', '100', '121000', '19919AB145D24F2BBF67EAB3389080A3', '282B9C8EE77F4630BF05A6E1CA585F0D');
INSERT INTO `orderitem` VALUES ('9B734DCB1DDB4C8E8154B16E5E646BCF', '1', '36585', 'CF65A81885EF469FB655950BE4179D1A', 'D707AC0C70C9439597A31619FB0141DE');
INSERT INTO `orderitem` VALUES ('9BF5BA12800E406EB34BF174311C5AC6', '1', '390', '201DEBA4ABA54BE6B2681A4886C2810E', '245BCE44F4D846AA8213520AAC7E69DA');
INSERT INTO `orderitem` VALUES ('9D40034B73A041D09BAEC83285B888A2', '99', '3621915', 'CF65A81885EF469FB655950BE4179D1A', '59250861C2B246429DD339A058CDF2A6');
INSERT INTO `orderitem` VALUES ('9D4F2B8435DB41D3A7BD6E24F9CA4AD7', '1', '660', '714C7FA44D22488F8B3BC9ED9629EAC5', '400C38A61A254D50BE44A389D73BBD8F');
INSERT INTO `orderitem` VALUES ('9E04FDE6335C416E93BCCA2F34B15D52', '20', '71320', '33832CF499DD46C4B342623A5F157830', 'E0E500A66B9043FCBCA3090B905DFFA7');
INSERT INTO `orderitem` VALUES ('9F72F98DF26C418FB03FF3D57D6F2A3C', '4', '219476', '7716E8D1B7754755AF0DF6328298B0DB', '11DF43B97FA94A589F1A850EBBCAF80F');
INSERT INTO `orderitem` VALUES ('A0B3625FFFAC4BD19FE9FCBDA53B2373', '2', '161320', '31BA10D35A104BCEB7BF6D9A70509A86', 'EF5EA4FDC00C4F598620DCE3661FA354');
INSERT INTO `orderitem` VALUES ('A256A83D9CA64B9ABCAED971E814F293', '2', '480', '4321C363C62A406C8851DC6F942F1630', '878AFCF5E6A54C58A15116F1E15EC2DB');
INSERT INTO `orderitem` VALUES ('A420D613E6A04D0CA6AA542510C54A5F', '1', '1511', '2DE3F3904CAF4085A48941F062EE6774', '1F1A36D42B924934A13CFC31982C598D');
INSERT INTO `orderitem` VALUES ('ADF71D7D1A354B239B17ABAEA61F1C3E', '1', '98645', '4688636014904B65AC04DCFAB248FB3F', 'D707AC0C70C9439597A31619FB0141DE');
INSERT INTO `orderitem` VALUES ('B23E9ECE5315454C8EB62DA63C99DECD', '2', '2420', '19919AB145D24F2BBF67EAB3389080A3', 'EBC10A01AB6841829E732D64CD0F09E4');
INSERT INTO `orderitem` VALUES ('B5EECC47C7DE4CDF8953B8123CB96CA7', '2', '2420', '19919AB145D24F2BBF67EAB3389080A3', '37AA7427F24C45548D899B67F07CA298');
INSERT INTO `orderitem` VALUES ('B6612F2E8EA64973A11FA0D2A64161C6', '4', '13200', '2E039BB6D02C4B3FB8F67A351DCDC411', '9E7CFC74F3F044E1848C215FFC1AF332');
INSERT INTO `orderitem` VALUES ('B67008FC2F6744AD8484941C9D009745', '1', '378444', '59F11A12F6A04A39BEBCB8B3F3394AF5', 'F81D50B533DC4E14BCE94A85F5B94610');
INSERT INTO `orderitem` VALUES ('BAC2EEF1B320457AA9E6C9FB0A65009E', '1', '80660', '31BA10D35A104BCEB7BF6D9A70509A86', '675FC2BEDCB940A887AEBC97508274CE');
INSERT INTO `orderitem` VALUES ('BB187E76F3EB4CB4ADCEC9CB9FBBAE52', '1', '300', '17FB09226A1F43C0BC08CA0F08E11B95', 'C21197F99B1C4ABBBB8868C082122B0A');
INSERT INTO `orderitem` VALUES ('CB58D419C0A4492CB6E34214B94F2140', '3', '4533', '2DE3F3904CAF4085A48941F062EE6774', 'EF5EA4FDC00C4F598620DCE3661FA354');
INSERT INTO `orderitem` VALUES ('D3AEDE7AC394489F97955427770095A4', '1', '3500', '927FCEC214E647DDA7242AEB4FE6AA26', 'C21197F99B1C4ABBBB8868C082122B0A');
INSERT INTO `orderitem` VALUES ('D725AEAE0AE84A819CA02353FA5C4DFF', '1', '1511', '2DE3F3904CAF4085A48941F062EE6774', '2A7CE065FB1143EA82235F42FD9520BA');
INSERT INTO `orderitem` VALUES ('E4EAAD9095564831911DF0015FF9B903', '5', '143300', '93D6BDCA98C64465B0CAD223A51F2332', '37AA7427F24C45548D899B67F07CA298');
INSERT INTO `orderitem` VALUES ('E57344D9F0A942BCAAD76B3450C31CCB', '1', '300', '17FB09226A1F43C0BC08CA0F08E11B95', '999235096D394C1886909AE902CFEB9C');
INSERT INTO `orderitem` VALUES ('EA8EE18546D04F4EA5C88D3AEC49E33E', '1', '28660', '93D6BDCA98C64465B0CAD223A51F2332', '95835A0DBFCB41609746919E8BFFB05C');
INSERT INTO `orderitem` VALUES ('F000E8AC14454F7E85AE94DA9A82F98F', '1', '378444', '59F11A12F6A04A39BEBCB8B3F3394AF5', 'AFF77D658A1F4A619632FF9BB2A4FE48');
INSERT INTO `orderitem` VALUES ('F2AC9CDDC2F145609137643F81AE3B2B', '1', '98645', '4688636014904B65AC04DCFAB248FB3F', 'AFF77D658A1F4A619632FF9BB2A4FE48');
INSERT INTO `orderitem` VALUES ('FA178CA9B4A5434B8E2602C73573E3EB', '9', '257949', '3401F7E1BC8646D1B3E2D684832653A8', 'F81D50B533DC4E14BCE94A85F5B94610');

-- ----------------------------
-- Table structure for `orders`
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `oid` varchar(32) NOT NULL,
  `ordertime` datetime DEFAULT NULL,
  `total` double DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `address` varchar(30) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `uid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('0DEB856C347A48A19682A1CDC4CAFB0C', '2017-06-26 18:42:15', '80960', '1', '包头师范学院', '孙磊', '11111111', '517F45C3CE7545B5A3050BFB2E3D8AE2');
INSERT INTO `orders` VALUES ('11DF43B97FA94A589F1A850EBBCAF80F', '2017-06-26 18:37:25', '219476', '0', '包头师范学院', '宋洋', '15848664681', '92DE1403D05041A2AF103F8C4D1ECB36');
INSERT INTO `orders` VALUES ('14A5426519F34224B899EF550E2F91F6', '2017-06-26 18:45:11', '403300', '0', '呼市', 'wj', '13614846069', '75C2A223568643DD8C6C50DCCE5DB2BD');
INSERT INTO `orders` VALUES ('1F1A36D42B924934A13CFC31982C598D', '2017-06-26 18:39:09', '486810', '1', '包头师范学院', '孙磊', '13545647890', '517F45C3CE7545B5A3050BFB2E3D8AE2');
INSERT INTO `orders` VALUES ('225829E7C5324E38B2A670E156AC222C', '2017-06-26 18:42:12', '986450', '0', '包头师范学院', '宋洋', '15848664681', '92DE1403D05041A2AF103F8C4D1ECB36');
INSERT INTO `orders` VALUES ('245BCE44F4D846AA8213520AAC7E69DA', '2017-06-26 18:38:17', '7269', '0', '阿萨德', '阿萨德', '150000', '517F45C3CE7545B5A3050BFB2E3D8AE2');
INSERT INTO `orders` VALUES ('282B9C8EE77F4630BF05A6E1CA585F0D', '2017-06-28 16:48:48', '121000', '0', '阿斯顿大所', '阿斯顿', '15848644100', 'D5964683E1404E738A3C2C690C4248D6');
INSERT INTO `orders` VALUES ('2A7CE065FB1143EA82235F42FD9520BA', '2017-06-26 18:44:02', '1511', '0', '', '', '', '75C2A223568643DD8C6C50DCCE5DB2BD');
INSERT INTO `orders` VALUES ('2F5F91D85EE949578529E5ED5C993BB3', '2017-06-28 16:36:39', '9900', '0', null, null, null, '75C2A223568643DD8C6C50DCCE5DB2BD');
INSERT INTO `orders` VALUES ('37AA7427F24C45548D899B67F07CA298', '2017-06-26 18:40:14', '2420590', '1', '包头师范学院', '宋洋', '15848664681', '92DE1403D05041A2AF103F8C4D1ECB36');
INSERT INTO `orders` VALUES ('400C38A61A254D50BE44A389D73BBD8F', '2017-06-26 18:41:18', '798830', '2', '内蒙古包头师范学院', 'wj', '13614846069', '75C2A223568643DD8C6C50DCCE5DB2BD');
INSERT INTO `orders` VALUES ('455BACC584D945AA81CA1F7E09266B94', '2017-06-26 18:37:36', '3566', '3', '阿萨德', '孙磊', '1333333333', '517F45C3CE7545B5A3050BFB2E3D8AE2');
INSERT INTO `orders` VALUES ('5258DC391759404183B0A465C304205D', '2017-06-26 18:41:56', '28660', '1', '内财大', '凯源', '12312312312', '476D02DAB0DB4CFE8EBFC168AFCCFF20');
INSERT INTO `orders` VALUES ('53D78E60BC1B402888D04F01E69328AB', '2017-06-26 18:38:40', '131400', '2', '包头师范学院', '宋洋', '15848664681', '92DE1403D05041A2AF103F8C4D1ECB36');
INSERT INTO `orders` VALUES ('59250861C2B246429DD339A058CDF2A6', '2017-06-26 18:38:41', '3621915', '3', '包头', '张家昕', '13847381981', '476D02DAB0DB4CFE8EBFC168AFCCFF20');
INSERT INTO `orders` VALUES ('675FC2BEDCB940A887AEBC97508274CE', '2017-06-26 18:44:58', '80660', '1', null, null, null, '75C2A223568643DD8C6C50DCCE5DB2BD');
INSERT INTO `orders` VALUES ('878AFCF5E6A54C58A15116F1E15EC2DB', '2017-06-26 18:36:32', '480', '2', 'beijing', 'tom', '15848644100', 'D5964683E1404E738A3C2C690C4248D6');
INSERT INTO `orders` VALUES ('95835A0DBFCB41609746919E8BFFB05C', '2017-06-26 18:37:08', '34329', '1', '包头师范学院', '刘国鑫', '18625478524', 'D5964683E1404E738A3C2C690C4248D6');
INSERT INTO `orders` VALUES ('999235096D394C1886909AE902CFEB9C', '2017-06-26 18:43:10', '300', '2', '包头师范学院', 'wj', '13614846069', '75C2A223568643DD8C6C50DCCE5DB2BD');
INSERT INTO `orders` VALUES ('9E7CFC74F3F044E1848C215FFC1AF332', '2017-06-26 18:45:50', '13200', '2', '集宁', 'wj', '13614846069', '75C2A223568643DD8C6C50DCCE5DB2BD');
INSERT INTO `orders` VALUES ('AFF77D658A1F4A619632FF9BB2A4FE48', '2017-06-26 18:37:16', '477089', '3', '包师', '张家昕', '13847381981', '476D02DAB0DB4CFE8EBFC168AFCCFF20');
INSERT INTO `orders` VALUES ('B920C3AD7BA34DE092A4C17BC386591B', '2017-06-26 18:39:17', '384083', '2', '哈哈小区', '张家昕', '15915915915', '476D02DAB0DB4CFE8EBFC168AFCCFF20');
INSERT INTO `orders` VALUES ('C21197F99B1C4ABBBB8868C082122B0A', '2017-06-26 18:40:02', '102985', '1', '包头师范学院', '孙磊', '1333333333', '517F45C3CE7545B5A3050BFB2E3D8AE2');
INSERT INTO `orders` VALUES ('D707AC0C70C9439597A31619FB0141DE', '2017-06-26 18:44:35', '7670328', '3', '包头师范学院', '孙磊', '133333333333', '517F45C3CE7545B5A3050BFB2E3D8AE2');
INSERT INTO `orders` VALUES ('E0E500A66B9043FCBCA3090B905DFFA7', '2017-06-26 18:41:03', '22671280', '2', '', '', '', '92DE1403D05041A2AF103F8C4D1ECB36');
INSERT INTO `orders` VALUES ('E538AE522A82414BA028D7EBE83364D7', '2017-06-26 18:41:47', '23400', '0', '包头师范学院', '宋洋', '15848664681', '92DE1403D05041A2AF103F8C4D1ECB36');
INSERT INTO `orders` VALUES ('EBC10A01AB6841829E732D64CD0F09E4', '2017-06-26 18:38:36', '3190', '0', '包头师范学院', 'wj', '13614846069', '75C2A223568643DD8C6C50DCCE5DB2BD');
INSERT INTO `orders` VALUES ('EF5EA4FDC00C4F598620DCE3661FA354', '2017-06-26 18:47:16', '194514', '0', '包头自由路', 'wj', '13614846069', '75C2A223568643DD8C6C50DCCE5DB2BD');
INSERT INTO `orders` VALUES ('F81D50B533DC4E14BCE94A85F5B94610', '2017-06-26 18:40:38', '4833543', '0', '火星', '张三', '78998788877', '476D02DAB0DB4CFE8EBFC168AFCCFF20');

-- ----------------------------
-- Table structure for `product`
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `pid` varchar(32) NOT NULL,
  `pname` varchar(50) DEFAULT NULL,
  `market_price` double DEFAULT NULL,
  `shop_price` double DEFAULT NULL,
  `pimage` varchar(200) DEFAULT NULL,
  `pdate` date DEFAULT NULL,
  `pcount` int(11) DEFAULT NULL,
  `is_hot` int(11) DEFAULT NULL,
  `pdesc` varchar(8192) DEFAULT NULL,
  `pflag` int(11) DEFAULT NULL,
  `cid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`pid`),
  KEY `sfk_0001` (`cid`),
  CONSTRAINT `sfk_0001` FOREIGN KEY (`cid`) REFERENCES `category` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('17FB09226A1F43C0BC08CA0F08E11B95', 'Maybelline/美宝莲--Mb10846', '388', '300', 'products\\17FB09226A1F43C0BC08CA0F08E11B95', '2017-06-26', null, '1', '产品名称：Maybelline/美宝莲</br>\r\n限期使用日期范围: 2019-02-01至2019-02-02</br>\r\n防晒指数: 其他/other</br>\r\nPA值: 无</br>\r\n适用对象: 通用</br>\r\n规格类型: 正常规格</br>\r\n化妆品净含量: 150ml</br>\r\n适用部位: 面部</br>\r\n防晒分类: 其它防晒品牌: Ultrasun</br>\r\n面部防晒单品: 晒后修护保湿乳(清凉补水型)</br>\r\n适合肤质: 敏感性肤质</br>\r\n是否为特殊用途化妆品: 否</br>\r\n化妆品批准文号: 国妆备进字J20139539</br>\r\n功效: 保湿 晒后修护</br>', '0', '2');
INSERT INTO `product` VALUES ('19919AB145D24F2BBF67EAB3389080A3', 'marc fisher-- 2612424954', '1399', '1210', 'products\\1344549070DE48289D180AF3B0B0B5A7.jpg', '2017-06-26', null, '0', '销售渠道类型: 商场同款(线上线下都销售)</br>\r\n品牌: marc fisher</br>\r\n货号: 2612424954</br>\r\n上市年份季节: 2017年夏季</br>\r\n风格: 欧美帮面</br>\r\n材质: 麂皮开口深度: 浅口鞋头</br>\r\n款式: 尖头后跟高: 高跟(5-8cm)</br>\r\n跟底款式: 细跟颜色分类: 湖蓝色 蓝色 玫红色 棕色 黑色 天蓝色</br>\r\n尺码: 10 11 5 5.5 6 6.5 7 7.5 8 8.5 9 9.5</br>\r\n鞋制作工艺: 胶粘鞋</br>\r\n图案: 纯色</br>\r\n', '0', 'F7C8C1DC5FD04FA880189BD5F94CBC92');
INSERT INTO `product` VALUES ('201DEBA4ABA54BE6B2681A4886C2810E', 'LA MER/海蓝之谜', '396', '390', 'products\\201DEBA4ABA54BE6B2681A4886C2810E', '2017-06-26', null, '1', '限期使用日期范围: 2016-05-01至2019-05-01</br>\r\n功效: 补水 保湿</br>\r\n规格类型: 正常</br>\r\n规格品牌: LA MER/海蓝之谜</br>\r\n面部护理套装: 保湿套装</br>\r\n产地: 美国</br>\r\n保质期: 3年</br>', '0', '2');
INSERT INTO `product` VALUES ('23AA0516CEF34CDB8FFD41C8FF805ABB', 'Marc Jacobs -- Q02354101', '2634', '2134', 'products\\23AA0516CEF34CDB8FFD41C8FF805ABB', '2017-06-26', null, '1', '品牌: Marc Jacobs</br>\r\n货号: Q02354101</br>\r\n上市年份季节: 2017年春季</br>\r\n帮面材质: PU</br>\r\n内里材质: PU</br>\r\n开口深度: 浅口</br>\r\n鞋头款式: 尖头</br>\r\n后跟高: 中跟(3-5cm)</br>\r\n跟底款式: 细跟</br>\r\n颜色分类: Black</br>\r\n尺码: 5 5.5 6 6.5 7 7.5 8 8.5</br>\r\n款式: 单鞋</br>\r\n适用对象: 青年（18-40周岁）</br>\r\n适用场景: 休闲鞋头</br>\r\n款式: 尖头</br>', '0', 'F7C8C1DC5FD04FA880189BD5F94CBC92');
INSERT INTO `product` VALUES ('2DE3F3904CAF4085A48941F062EE6774', 'Tiffany/蒂芙尼-- GRP03577', '2199', '1511', 'products\\2DE3F3904CAF4085A48941F062EE6774', '2017-06-26', null, '1', '材质: 银饰</br>\r\n 金属材质: 99足银</br>\r\n 颜色分类: 天蓝色</br>\r\n 品牌: Tiffany/蒂芙尼</br>\r\n 价格区间: 1001-3000元</br>\r\n 货号: GRP03577</br>\r\n 价格：2199.00</br>', '0', '1');
INSERT INTO `product` VALUES ('2E039BB6D02C4B3FB8F67A351DCDC411', 'Adidas/阿迪达斯', '3900.78', '3300', 'products\\FE7CF54F1A344F39909AFDD0C4BD0022.jpg', '2017-06-26', null, '1', '品牌: Adidas/阿迪达斯</br>\r\n鞋码: 36 36.5 37.5 38 38.5 39 40 40.5 41 42 43', '0', 'F7C8C1DC5FD04FA880189BD5F94CBC92');
INSERT INTO `product` VALUES ('307FB7FB2DCC49BA8236EC1D23381307', 'Shiseido/资生堂 悦薇珀翡', '830', '770', 'products\\307FB7FB2DCC49BA8236EC1D23381307', '2017-06-26', null, '0', '产品名称：Shiseido/资生堂 悦薇珀翡</br>\r\n化妆品品类: 柔肤水</br>\r\n限期使用日期范围: 2019-10-01至2019-10-01</br>\r\n规格类型: 正常规格化妆品</br>\r\n净含量: 150ml</br>\r\n品牌: Shiseido/资生堂</br>\r\n资生堂单品: 悦薇珀翡紧颜亮肤水(滋润型)</br>\r\n是否为特殊用途化妆品: 否</br>\r\n功效: 滋润', '0', '2');
INSERT INTO `product` VALUES ('309260391B6E4528BEDCD40F16028892', 'Hermes/爱马仕--H104567B 00ST', '5928', '5669', 'products\\309260391B6E4528BEDCD40F16028892', '2017-06-26', null, '0', '上市时间: 2016年夏季</br>\r\n品牌: Hermes/爱马仕</br>\r\n货号: H104567B 00ST</br>\r\n颜色分类: 图片色</br>\r\n', '0', '1');
INSERT INTO `product` VALUES ('31BA10D35A104BCEB7BF6D9A70509A86', 'Cartier/卡地亚--B6013302', '80900', '80660', 'products\\31BA10D35A104BCEB7BF6D9A70509A86', '2017-06-26', null, '1', '上市时间: 2016年秋季</br>\r\n品牌: Cartier/卡地亚</br>\r\n货号: B6013302</br>\r\n颜色分类: 图片色</br>\r\n', '0', '1');
INSERT INTO `product` VALUES ('32447CAF2EE441A297F3675F31856CE7', 'Cartier/卡地亚-- N6035017', '359963', '356668', 'products\\32447CAF2EE441A297F3675F31856CE7', '2017-06-26', null, '1', '上市时间: 2016年秋季</br>\r\n品牌: Cartier/卡地亚</br>\r\n货号: N6035017</br>\r\n颜色分类: 玫瑰金 金色</br>\r\n价格：359963</br>', '0', '1');
INSERT INTO `product` VALUES ('33832CF499DD46C4B342623A5F157830', 'Tiffany/蒂芙尼--35945369', '4537', '3566', 'products\\33832CF499DD46C4B342623A5F157830', '2017-06-26', null, '1', '上市时间: 2017年春夏</br>\r\n 颜色分类: 图片色</br>\r\n 风格: 优雅</br>\r\n 品牌: Tiffany/蒂芙尼</br>\r\n 型号: 35945369</br>\r\n 功能: 防UVA 防UVB</br>\r\n 眼镜配件类型: 镜布 镜盒</br>\r\n\r\n', '0', '59FDCCC039EE489A8BDC4D88A9A1C468');
INSERT INTO `product` VALUES ('3401F7E1BC8646D1B3E2D684832653A8', 'Fendi/芬迪--FF7818W1DF0ZNJ', '30661', '28661', 'products\\3401F7E1BC8646D1B3E2D684832653A8', '2017-06-26', null, '0', '材质成分: 其他100%</br>\r\n品牌: Fendi/芬迪</br>\r\n货号: FF7818W1DF0ZNJ</br>\r\n衣长: 中长款</br>\r\n袖长: 五分袖</br>\r\n上市年份季节: 2016年秋季</br>\r\n颜色分类: 黑色</br>\r\n尺码: 40 42 44 46</br>\r\n', '0', '7AC81023B9A14D17AE6E717CCB96100C');
INSERT INTO `product` VALUES ('3771E99D108847CFAA69901349989FEA', ' Saint Laurent Paris--320221AEG006920', '6837', '6237', 'products\\9298F98F164342968048F696F703FFDD.jpg', '2017-06-26', null, '1', '品牌: Saint Laurent Paris</br>\r\n货号: 320221AEG006920</br>\r\n上市年份季节: 2016年秋季</br>\r\n风格: 优雅</br>\r\n帮面材质: 头层牛皮</br>\r\n内里材质: 无内里</br>\r\n开口深度: 浅口鞋头</br>\r\n款式: 尖头</br>\r\n后跟高: 超高跟(大于8cm)</br>\r\n跟底款式: 细跟</br>\r\n颜色分类: 淡紫色 </br>\r\n黑色尺码: 34 35 36 36.5 37 37.5 38 38.5 39 40 41</br>\r\n图案: 纯色</br>\r\n款式: 单鞋</br>\r\n适用对象: 青年（18-40周岁）</br>\r\n适用场景: 正装鞋头</br>\r\n款式: 尖头</br>\r\n', '0', 'F7C8C1DC5FD04FA880189BD5F94CBC92');
INSERT INTO `product` VALUES ('3A1414DA79CD4D9985CA5A82B3B26E5D', 'Chanel/香奈儿 蔚蓝男士淡', '585', '540', 'products\\3A1414DA79CD4D9985CA5A82B3B26E5D', '2017-06-26', null, '1', '产品名称：Chanel/香奈儿 蔚蓝男士淡...</br>\r\n上市时间: 2012年</br>\r\n是否为特殊用途化妆品: 否</br>\r\n限期使用日期范围: 2018-11-20至2019-11-13</br>\r\n颜色分类: 透明</br>\r\n香水分类: 淡香水EDT</br>\r\n净含量: 50mL 100mL 150mL</br>\r\n香味: 其他/other</br>\r\n香调: 其他/other</br>\r\n规格类型: 正常规格</br>\r\n适用性别: 男</br>\r\n品牌: Chanel/香奈儿</br>\r\n香水单品: 蔚蓝男士淡香水</br>\r\n适合肤质: 任何肤质</br>\r\n产地: 法国</br>\r\n保质期: 5年</br>\r\n', '0', '2');
INSERT INTO `product` VALUES ('3A5D99C926B941699F02A86A0E7EC1F0', 'Chanel/香奈儿 细管润唇膏', '362', '350', 'products\\3A5D99C926B941699F02A86A0E7EC1F0', '2017-06-26', null, '1', '产品名称：Chanel/香奈儿 细管润唇膏</br></br>\r\n限期使用日期范围: 2018-04-01至2018-05-01</br>\r\n颜色分类: 222 224</br>\r\n规格类型: 正常规格</br>\r\n品牌: Chanel/香奈儿</br>\r\n唇膏/口红单品: 细管润唇膏</br>\r\n功效: 遮瑕 滋润 保湿</br>\r\n产地: 法国</br>\r\n适合肤质: 任何肤质</br>\r\n保质期: 3年</br>\r\n', '0', '2');
INSERT INTO `product` VALUES ('3B4E6306826B4E04BE9A2F0057BF559A', 'ORLANDO/奥兰朵', '13377', '13140', 'products\\3B4E6306826B4E04BE9A2F0057BF559A', '2017-06-26', null, '1', '颜色分类: 金\r\n 品牌: ORLANDO/奥兰朵\r\n 价格区间: 3000元以上\r\n价格：13377.00', '0', '1');
INSERT INTO `product` VALUES ('3D6D4BB3C706483BB82A70664AB13805', 'Tiffany/蒂芙尼--GRP09073', '11767', '11511', 'products\\3D6D4BB3C706483BB82A70664AB13805', '2017-06-26', null, '1', '材质: 合金/镀银/镀金</br>\r\n 颜色分类: 银色</br>\r\n 品牌: Tiffany/蒂芙尼</br>\r\n 价格区间: 3000元以上</br>\r\n 货号: GRP09073</br>\r\n', '0', '1');
INSERT INTO `product` VALUES ('4321C363C62A406C8851DC6F942F1630', 'Chanel/香奈儿--炫亮魅力印记唇釉', '382', '240', 'products\\4321C363C62A406C8851DC6F942F1630', '2017-06-26', null, '1', '产品名称：Chanel/香奈儿 炫亮魅力印...</br>\r\n上市时间: 2016年</br>\r\n月份: 9月</br>\r\n化妆品保质期: 36个月</br>\r\n是否为特殊用途化妆品: 否</br>\r\n限期使用日期范围: 2019-12-24至2019-12-31</br>\r\n颜色分类: 152 144 142 148</br>\r\n规格类型: 正常规格</br>\r\n品牌: Chanel/香奈儿</br>\r\n唇彩/唇蜜单品: 炫亮魅力印记唇釉</br>\r\n功效: 滋润</br>\r\n产地: 法国</br>\r\n保质期: 3年</br>\r\n适合肤质: 任何肤质</br>\r\n', '0', '2');
INSERT INTO `product` VALUES ('4688636014904B65AC04DCFAB248FB3F', 'Cartier/卡地亚--W1556362', '99645', '98645', 'products\\4688636014904B65AC04DCFAB248FB3F', '2017-06-26', null, '0', '保修: 国际联保</br>\r\n手表镜面材质: 人工合成蓝宝石表镜</br>\r\n品牌: Cartier/卡地亚</br>\r\nCartier/卡地亚系列: 高级珠宝腕表</br>\r\n型号: W1556362</br>\r\n机芯类型: 机械机芯-手动机械机芯</br>\r\n手表种类: 女</br>\r\n风格: 时尚潮流</br>\r\n表带材质: 真皮</br>\r\n颜色分类: 褐色</br>\r\n防水深度: 30米生活防水</br>\r\n品牌产地: 瑞士</br>\r\n表壳材质: 精钢</br>\r\n价格：99645', '0', '8EE24DFEFAE54EDFAB13E49994F644DE');
INSERT INTO `product` VALUES ('59E789BBA9FA443A97819CF78E0AE695', 'Cartier/卡地亚--B6036818', '10244', '10066', 'products\\59E789BBA9FA443A97819CF78E0AE695', '2017-06-26', null, '1', '上市时间: 2016年秋季</br>\r\n品牌: Cartier/卡地亚</br>\r\n货号: B6036818</br>\r\n颜色分类: 玫瑰金</br>\r\n', '0', '1');
INSERT INTO `product` VALUES ('59F11A12F6A04A39BEBCB8B3F3394AF5', 'IWC/万国-- IW397201', '386400', '378444', 'products\\59F11A12F6A04A39BEBCB8B3F3394AF5', '2017-06-26', null, '1', '保修: 国际联保</br>\r\n 手表镜面材质: 人工合成蓝宝石表镜</br>\r\n 品牌: IWC/万国</br>\r\n IWC/万国系列: 葡萄牙系列</br>\r\n 葡萄牙系列型号: IW397201</br>\r\n 机芯类型: 机械机芯-自动机械机芯</br>\r\n 手表种类: 男</br>\r\n 风格: 时尚潮流</br>\r\n 表带材质: 皮革</br>\r\n 形状: 圆形</br>\r\n 显示方式: 指针式</br>\r\n 颜色分类: 黑色</br>\r\n 防水深度: 30米生活防水</br>\r\n 附加功能: 计时码表 日历 月份显示</br>\r\n 表底类型: 透底</br>\r\n 表冠类型: 普通</br>\r\n 表盘直径: 45mm</br>\r\n 品牌产地: 瑞士</br>\r\n 表壳材质: 金属</br>\r\n', '0', '8EE24DFEFAE54EDFAB13E49994F644DE');
INSERT INTO `product` VALUES ('5A607C716B47402094EA988F1359C38C', 'Prada/普拉达--743651', '6802', '6609', 'products\\5A607C716B47402094EA988F1359C38C', '2017-06-26', null, '1', '材质成分: 羊毛100%</br>\r\n货号: 743651</br>\r\n品牌: Prada/普拉达</br>\r\n厚薄: 常规款</br>\r\n衣长: 常规款</br>\r\n袖长: 长袖</br>\r\n年份/季节: 2016年秋季</br>\r\n颜色分类: 灰色 白色</br>\r\n尺码: 36 38 40 42 44 46 48 50</br>\r\n', '0', '7AC81023B9A14D17AE6E717CCB96100C');
INSERT INTO `product` VALUES ('5CE6FDE695694CBD9A12120A0A413685', 'Cartier/卡地亚--B7219500', '20100', '19986', 'products\\5CE6FDE695694CBD9A12120A0A413685', '2017-06-26', null, '1', '上市时间: 2016年秋季</br>\r\n品牌: Cartier/卡地亚</br>\r\n货号: B7219500</br>\r\n颜色分类: 玫瑰金 金色</br>\r\n', '0', '1');
INSERT INTO `product` VALUES ('6977FE630A164FA39CEC54429B0764E3', ' Gucci/古奇--190489', '66254', '6559', 'products\\6977FE630A164FA39CEC54429B0764E3', '2017-06-26', null, '1', '上市时间: 2017年春夏</br>\r\n品牌: Gucci/古奇</br>\r\n货号: 190489 J8400 8106</br>\r\n颜色分类: 银色</br>\r\n', '0', '1');
INSERT INTO `product` VALUES ('6F4CF22E23F2482CB9208A0594D1CAD8', 'Estee Lauder/雅诗兰黛', '588', '300', 'products\\D459EA29F73349389E77DAB07899EAE8.jpg', '2017-06-26', null, '1', '限期使用日期范围: 2018-01-01至2018-12-31</br>\r\n功效: 补水 保湿 提亮肤色 滋润 嫩肤 收缩毛孔舒缓肌肤</br>\r\n规格类型: 正常规格</br>\r\n品牌: Estee Lauder/雅诗兰黛</br>\r\n雅诗兰黛单品: 雅诗兰黛小棕瓶面部精华30ml+原生液150ml+多效智妍</br>\r\n产地: 美国</br>\r\n价格：2180</br>', '0', '2');
INSERT INTO `product` VALUES ('70CF5E0279F04CC38E2FC76FB3C6B461', 'Cartier/卡地亚--N6708617', '724525', '699525', 'products\\70CF5E0279F04CC38E2FC76FB3C6B461', '2017-06-26', null, '0', '上市时间: 2016年秋季</br>\r\n品牌: Cartier/卡地亚</br>\r\n货号: N6708617</br>\r\n颜色分类: 玫瑰金</br>\r\n', '0', '1');
INSERT INTO `product` VALUES ('714C7FA44D22488F8B3BC9ED9629EAC5', 'Chanel/香奈儿 五号香水', '880', '660', 'products\\4C1BA5D7F6894A90A892776169819D4E.jpg', '2017-06-26', null, '0', '产品名称：Chanel/香奈儿 五号香水</br>\r\n上市时间: 2009年</br>\r\n限期使用日期范围: 2018-04-30至2019-04-29</br>\r\n颜色分类: 淡黄色</br>\r\n香水分类: 香水EDP</br>\r\n净含量: 50mL 100mL</br>\r\n香味: 玫瑰 茉莉 橙花 香草 檀香</br>\r\n香调: 花香调</br>\r\n规格类型: 正常规格</br>\r\n适用性别: 女</br>\r\n品牌: Chanel/香奈儿</br>\r\n香水单品: 五号香水</br>\r\n适合肤质: 任何肤质</br>\r\n产地: 法国</br>\r\n保质期: 3年</br>\r\n', '0', '2');
INSERT INTO `product` VALUES ('733595079D454088B61D4D596A8CE2F2', 'I.N.C. International Concepts--161002444', '2699', '2199', 'products\\40FC983B2C944291AF645CD0C93DAA47.jpg', '2017-06-26', null, '1', '销售渠道类型: 商场同款(线上线下都销售)</br>\r\n品牌: I.N.C. International Concepts</br>\r\n货号: 161002444</br>\r\n上市年份季节: 2017年春季</br>\r\n风格: 欧美</br>\r\n开口深度: 浅口鞋头</br>\r\n款式: 尖头</br>\r\n后跟高: 高跟(5-8cm)</br>\r\n跟底款式: 细跟</br>\r\n流行元素: 铆钉 金属装饰</br>\r\n闭合方式: 套脚</br>\r\n颜色分类: 黑色 虾粉色 白色 蓝色(牛仔布鞋面） 咖啡色 深棕色</br>\r\n尺码: 10 5 5.5 6 6.5 7 7.5 8 8.5 9 9.5</br>\r\n鞋制作工艺: 胶粘鞋图案: 纯色</br>\r\n', '0', 'F7C8C1DC5FD04FA880189BD5F94CBC92');
INSERT INTO `product` VALUES ('7716E8D1B7754755AF0DF6328298B0DB', 'Jimmy Choo--CANDYGAC', '56562', '54869', 'products\\7716E8D1B7754755AF0DF6328298B0DB', '2017-06-26', null, '1', '上市时间: 2017年春夏</br>\r\n大小: 小</br>\r\n流行款式名称: 其他</br>\r\n款式: 手拿包</br>\r\n拿包方式: 手拿</br>\r\n质地: 其他</br>\r\n颜色分类: 图片色</br>\r\n成色: 全新</br>\r\n品牌: Jimmy Choo</br>\r\n货号: CANDYGAC</br>\r\n', '0', '7871B30DE0834587AE8DC0004D6AD71F');
INSERT INTO `product` VALUES ('77684261F03E43D1BB37CE3840ACACB1', 'Tiffany/蒂芙尼--GRP09427', '3097', '2688', 'products\\77684261F03E43D1BB37CE3840ACACB1', '2017-06-26', null, '1', '材质: 银饰</br>\r\n 金属材质: 足银</br>\r\n 颜色分类: 小号 中号 大号</br>\r\n 品牌: Tiffany/蒂芙尼</br>\r\n 价格区间: 3000元以上</br>\r\n 货号: GRP09427</br>\r\n', '0', '1');
INSERT INTO `product` VALUES ('855DD5F5E9F442EDA534BD9D04E69847', 'Cartier/卡地亚--B8027100', '20694', '18694', 'products\\855DD5F5E9F442EDA534BD9D04E69847', '2017-06-26', null, '1', '上市时间: 2016年秋季</br>\r\n品牌: Cartier/卡地亚</br>\r\n货号: B8027100</br>\r\n颜色分类: 图片色</br>\r\n', '0', '1');
INSERT INTO `product` VALUES ('8708DFDB16814E5BB13FBBAA0A033B0A', 'Dolce&Gabbana--65I-01Z054', '10905', '9988', 'products\\8708DFDB16814E5BB13FBBAA0A033B0A', '2017-06-26', null, '0', '材质成分: 桑蚕丝94% 其他6%</br>\r\n腰型: 自然腰</br>\r\n货号: 65I-01Z054</br>\r\n品牌: Dolce&Gabbana</br>\r\n裙长: 中裙</br>\r\n年份季节: 2017年春季</br>\r\n颜色分类: 黑色</br>\r\n尺码: 38 40 42 44 46 48</br>\r\n', '0', '7AC81023B9A14D17AE6E717CCB96100C');
INSERT INTO `product` VALUES ('8B811D1095E04EB2BE52A5FDA844A6F8', 'Shiseido/资生堂--s564555', '652', '620', 'products\\8B811D1095E04EB2BE52A5FDA844A6F8', '2017-06-26', null, '1', '产品名称：Shiseido/资生堂--s564555</br>\r\n限期使用日期范围: 2020-11-01至2020-11-01</br>\r\n规格类型: 正常规格</br>\r\n功效: 保湿 滋润 抗皱</br>\r\n化妆品净含量: 50ml</br>\r\n品牌: Shiseido/资生堂</br>\r\n资生堂单品: 百优全新精纯乳霜</br>\r\n是否为特殊用途化妆品: 否</br>', '0', '2');
INSERT INTO `product` VALUES ('927FCEC214E647DDA7242AEB4FE6AA26', 'Tiffany/蒂芙尼--37958166', '3714', '3500', 'products\\927FCEC214E647DDA7242AEB4FE6AA26', '2017-06-26', null, '1', '上市时间: 2017年春夏\r\n 颜色分类: 玫瑰金色\r\n 风格: 前卫\r\n 品牌: Tiffany/蒂芙尼\r\n 型号: 37958166\r\n 功能: 防UVA 防UVB\r\n 眼镜配件类型: 镜布 镜盒\r\n价格：3714.00', '0', '59FDCCC039EE489A8BDC4D88A9A1C468');
INSERT INTO `product` VALUES ('93D6BDCA98C64465B0CAD223A51F2332', 'Hermes/爱马仕--PI182ZTAU', '29700', '28660', 'products\\93D6BDCA98C64465B0CAD223A51F2332', '2017-06-26', null, '1', '上市时间: 2017年春夏</br>\r\n大小: 中</br>\r\n流行款式名称: 其他</br>\r\n款式: 手提包</br>\r\n质地: 其他</br>\r\n颜色分类: 深蓝色</br>\r\n适用场景: 休闲</br>\r\n品牌: Hermes/爱马仕</br>\r\nHermes/爱玛仕系列: 其他</br>\r\n货号: PI182ZTAU</br>\r\n风格: 欧美时尚</br>\r\n价格：29700</br>', '0', '7871B30DE0834587AE8DC0004D6AD71F');
INSERT INTO `product` VALUES ('94E4772DCB9D400CA0091708455E5081', 'Gucci/古驰--283719-F6BB0', '3120', '3099', 'products\\45F183DF80554BAAAA8A7BAE605985BE.jpg', '2017-06-26', null, '1', '品牌: Gucci/古驰</br>\r\n货号: 283719-F6BB0</br>\r\n上市年份季节: 2017年夏季</br>\r\n帮面材质: 多种材质拼接拼接</br>\r\n主要材质: 头层牛皮内里材质: 头层牛皮</br>\r\n开口深度: 浅口鞋头款式: 圆头</br>\r\n后跟高: 低跟(1-3cm)</br>\r\n跟底款式: 平跟</br>\r\n颜色分类: 深蓝色4061-DJI 米白色9788-DJI 棕色9794-DJI</br>\r\n尺码: 35 35.5 36 36.5 37</br>\r\n款式: 单鞋</br>\r\n适用对象: 青年（18-40周岁）</br>\r\n适用场景: 休闲鞋头款式: 圆头</br>\r\n', '0', 'F7C8C1DC5FD04FA880189BD5F94CBC92');
INSERT INTO `product` VALUES ('9B3936F4F9FD4C4D836E4765D14B5BCF', 'Hermes/爱马仕-- H215417B 00LG', '38534', '27534', 'products\\9B3936F4F9FD4C4D836E4765D14B5BCF', '2017-06-26', null, '1', '上市时间: 2016年夏季</br>\r\n品牌: Hermes/爱马仕</br>\r\n货号: H215417B 00LG</br>\r\n颜色分类: 玫瑰金色</br>\r\n价格：38534</br>', '0', '1');
INSERT INTO `product` VALUES ('9BD883F7AC3A43B7A3717E15CE8B472B', ' Nine West/玖熙-- 18597796', '1299', '899', 'products\\6BA9A869D5464E568FC23487567AFEEC.jpg', '2017-06-26', null, '1', '品牌: Nine West/玖熙</br>\r\n货号: 18597796</br>\r\n上市年份季节: 2016年春季</br>\r\n帮面材质: 牛二层皮覆</br>\r\n膜内里材质: 无内里</br>\r\n开口深度: 浅口鞋头</br>\r\n款式: 尖头</br>\r\n后跟高: 中跟(3-5cm)</br>\r\n跟底款式: 细跟</br>\r\n颜色分类: BLK L BLK SUEDE DK BLUE SY DK BROWN SUEDE DK GRAY MU/BLK MEDIUM NATURAL L PURPLE M FLO</br>\r\n尺码: 5 5.5 6 6.5 7 7.5 8 8.5 9 9.5</br>\r\n款式: 单鞋</br>\r\n适用对象: 青年（18-40周岁）</br>\r\n适用场景: 正装</br>\r\n鞋头款式: 尖头</br>\r\n', '0', 'F7C8C1DC5FD04FA880189BD5F94CBC92');
INSERT INTO `product` VALUES ('9DA4E16881C648CEB50CE843B0E9B497', 'Tod’s--XXW17A0S330OW09999', '4456', '4199', 'products\\45D78D24873A4AC7A239CFCD5E13CE4E.jpg', '2017-06-26', null, '1', '品牌: Tod’s</br>\r\n货号: XXW17A0S330OW09999</br>\r\n上市年份季节: 2017年夏季</br>\r\n帮面材质: 头层牛皮</br>\r\n内里材质: 无内里</br>\r\n开口深度: 浅口鞋头</br>\r\n款式: 尖头</br>\r\n后跟高: 超高跟(大于8cm)</br>\r\n跟底款式: 粗跟</br>\r\n颜色分类: 图片1 图片2尺码: 35 35.5 36 36.5 37 37.5 38 38.5 39 39.5 40</br>\r\n款式: 单鞋</br>\r\n适用对象: 青年（18-40周岁）</br>\r\n适用场景: 休闲鞋头</br>\r\n款式: 尖头</br>\r\n', '0', 'F7C8C1DC5FD04FA880189BD5F94CBC92');
INSERT INTO `product` VALUES ('AD4477FD9F5846489C99D8FC869B3770', 'Paula‘s Choice--PCe156423', '6559', '6542', 'products\\AD4477FD9F5846489C99D8FC869B3770', '2017-06-26', null, '1', '产品名称：Paula‘s Choice--PCe156423</br>\r\n化妆品品类: 化妆水/爽肤水限期</br>\r\n使用日期范围: 2019-06-30至2019-06-30</br>\r\n规格类型: 正常规格</br>\r\n化妆品净含量: 118ml</br>\r\n适合肤质: 油性及混合性肤质</br>\r\n品牌: Paula‘s Choice/宝拉珍选</br>\r\n化妆水/爽肤水单品: 淡红舒缓精华水</br>\r\n是否为特殊用途化妆品: 否', '0', '2');
INSERT INTO `product` VALUES ('AF0B6567A1894E579B4C639B2A7174A2', 'MaxMara--8221157906003', '5510', '5300', 'products\\AF0B6567A1894E579B4C639B2A7174A2', '2017-06-26', null, '1', '材质成分: 聚酰胺纤维(锦纶)100%</br>\r\n货号: 8221157906003</br>\r\n风格: 通勤</br>\r\n通勤: 简约</br>\r\n裙长: 中裙</br>\r\n袖长: 无袖</br>\r\n领型: 圆领</br>\r\n品牌: MaxMara</br>\r\n适用年龄: 25-29周岁</br>\r\n年份季节: 2017年春季</br>\r\n颜色分类: 蓝色</br>\r\n尺码: 36 38 40 42 44 46</br>\r\n', '0', '7AC81023B9A14D17AE6E717CCB96100C');
INSERT INTO `product` VALUES ('B2FBE3F120274032B3B851BC1513EBF2', 'IWC/万国--IW546304', '393800', '376666', 'products\\B2FBE3F120274032B3B851BC1513EBF2', '2017-06-26', null, '1', '保修: 国际联保</br>\r\n 手表镜面材质: 人工合成蓝宝石表镜</br>\r\n 品牌: IWC/万国</br>\r\n IWC/万国系列: 葡萄牙系列</br>\r\n 葡萄牙系列型号: IW546304</br>\r\n 机芯类型: 机械机芯-手动机械机芯</br>\r\n 手表种类: 男</br>\r\n 风格: 经典复古</br>\r\n 表带材质: 真皮</br>\r\n 形状: 圆形</br>\r\n 颜色分类: 深棕色</br>\r\n 防水深度: 30米生活防水</br>\r\n 附加功能: 陀飞轮</br>\r\n 表底类型: 透底</br>\r\n 表冠类型: 普通</br>\r\n 表盘厚度: 11mm</br>\r\n 表盘直径: 43mm</br>\r\n 品牌产地: 瑞士</br>\r\n 表壳材质: 合金</br>\r\n', '0', '8EE24DFEFAE54EDFAB13E49994F644DE');
INSERT INTO `product` VALUES ('BE3812A011DF429A8B38BD1C2BE6C9C1', ' Tiffany/蒂芙尼--35389474', '3817', '3566', 'products\\BE3812A011DF429A8B38BD1C2BE6C9C1', '2017-06-26', null, '1', '上市时间: 2017年春夏</br>\r\n 颜色分类: 象牙白</br>\r\n 风格: 简约</br>\r\n 品牌: Tiffany/蒂芙尼</br>\r\n 型号: 35389474</br>\r\n 功能: 防UVA 防UVB</br>\r\n 眼镜配件类型: 镜布 镜盒</br>\r\n', '0', '59FDCCC039EE489A8BDC4D88A9A1C468');
INSERT INTO `product` VALUES ('BE55765AE0A04E2E9D8F237036B8079A', 'Tiffany/蒂芙尼--GRP09518', '201161', '191161', 'products\\BE55765AE0A04E2E9D8F237036B8079A', '2017-06-26', null, '1', '材质: 其他</br>\r\n 颜色分类: 银色 玫瑰色 金色</br>\r\n 品牌: Tiffany/蒂芙尼</br>\r\n 价格区间: 3000元以上</br>\r\n 货号: GRP09518</br>\r\n 价格： 201161.00</br>', '0', '1');
INSERT INTO `product` VALUES ('BE8C2DE265A54B1A8F6E87FB596DF476', 'Hermes/爱马仕--H700001F 23GM', '5878', '5676', 'products\\BE8C2DE265A54B1A8F6E87FB596DF476', '2017-06-26', null, '0', '上市时间: 2016年夏季</br>\r\n品牌: Hermes/爱马仕</br>\r\n货号: H700001F 23GM</br>\r\n', '0', '1');
INSERT INTO `product` VALUES ('BF72127557394136B88AC8928D16B225', 'Tiffany/蒂芙尼-- 35386173', '3920', '3655', 'products\\BF72127557394136B88AC8928D16B225', '2017-06-26', null, '1', '上市时间: 2017年春夏</br>\r\n 颜色分类: 棕色</br>\r\n 品牌: Tiffany/蒂芙尼</br>\r\n 型号: 35386173</br>\r\n 功能: 防UVA 防UVB</br>\r\n 眼镜配件类型: 镜布 镜盒</br>\r\n', '0', '59FDCCC039EE489A8BDC4D88A9A1C468');
INSERT INTO `product` VALUES ('C7AE3D1A3F4B407589CFDB44BA7B8D48', 'Dolce&Gabbana--65I-01Z033', '29113', '28123', 'products\\C7AE3D1A3F4B407589CFDB44BA7B8D48', '2017-06-26', null, '1', '材质成分: 桑蚕丝56% 其他44%</br>\r\n货号: 65I-01Z033</br>\r\n裙长: 中裙</br>\r\n袖长: 长袖</br>\r\n品牌: Dolce&Gabbana</br>\r\n适用年龄: 25-29周岁</br>\r\n年份季节: 2017年春季</br>\r\n颜色分类: 蓝色</br>\r\n尺码: 38 40 42 44 46 48</br>\r\n', '0', '7AC81023B9A14D17AE6E717CCB96100C');
INSERT INTO `product` VALUES ('C9A1BEAEB5E949709C10866F246C1AB1', 'MaxMara--1221067206008', '4508', '4206', 'products\\C9A1BEAEB5E949709C10866F246C1AB1', '2017-06-26', null, '1', '材质成分: 棉100%</br>\r\n货号: 1221067206008</br>\r\n裙长: 中裙</br>\r\n品牌: MaxMara</br>\r\n适用年龄: 25-29周岁</br>\r\n年份季节: 2017年夏季</br>\r\n颜色分类: 图片1 图片2</br>\r\n尺码: 36 38 40 42 44 46 48</br>\r\n', '0', '7AC81023B9A14D17AE6E717CCB96100C');
INSERT INTO `product` VALUES ('CF65A81885EF469FB655950BE4179D1A', 'Cartier/卡地亚--W69016Z4', '39585', '36585', 'products\\CF65A81885EF469FB655950BE4179D1A', '2017-06-26', null, '0', '保修: 国际联保</br>\r\n手表镜面材质: 人工合成蓝宝石表镜</br>\r\n品牌: Cartier/卡地亚</br>\r\nCartier/卡地亚系列: 高级珠宝腕表</br>\r\n型号: W69016Z4</br>\r\n机芯类型: 机械机芯</br>\r\n手表种类: 男</br>\r\n风格: 时尚潮流</br>\r\n表带材质: 真皮</br>\r\n颜色分类: 黑色</br>\r\n防水深度: 30米生活防水</br>\r\n品牌产地: 瑞士</br>\r\n表壳材质: 精钢</br>\r\n', '0', '8EE24DFEFAE54EDFAB13E49994F644DE');
INSERT INTO `product` VALUES ('D265CD8BD65344A5A5362CD297F22EDD', ' Clinique/倩碧', '388', '308', 'products\\D265CD8BD65344A5A5362CD297F22EDD', '2017-06-26', null, '1', '限期使用日期范围: 2018-08-01至2019-01-01</br>\r\n颜色分类: 有油黄油 无油黄油</br>\r\n功效: 滋润</br>\r\n规格类型: 正常规格</br>\r\n品牌: Clinique/倩碧</br>\r\n倩碧单品: 无油黄油</br>\r\n适合肤质: 油性及混合性肤质</br>\r\n产地: 美国</br>', '0', '2');
INSERT INTO `product` VALUES ('D4AE9AB332C7480697F12D2136074FA3', 'Chanel/香奈儿--可可小姐唇膏', '950', '699', 'products\\D4AE9AB332C7480697F12D2136074FA3', '2017-06-26', null, '1', '产品名称：Chanel/香奈儿 可可小姐唇...</br>\r\n是否为特殊用途化妆品: 否</br>\r\n限期使用日期范围: 2018-08-31至2019-08-30</br>\r\n颜色分类: 450号 448号 412号 404 402 414号 444号 440号 426号 428号 422号 462 418 420 434 452 454 456 442号 416号 410 438 424 446 400 432号 460</br>\r\n规格类型: 正常规格</br>\r\n品牌: Chanel/香奈儿</br>\r\n唇膏/口红单品: 可可小姐唇膏</br>\r\n功效: 遮瑕 滋润 保湿</br>\r\n产地: 法国</br>\r\n适合肤质: 任何肤质</br>\r\n保质期: 3年</br>\r\n价格：950</br>', '0', '2');
INSERT INTO `product` VALUES ('D9D909CE14AA4BB9A168CCDFC2BBAB3B', 'Dolce&Gabbana--65I-G4F018', '12513', '12066', 'products\\D9D909CE14AA4BB9A168CCDFC2BBAB3B', '2017-06-26', null, '1', '材质成分: 其他100%</br>\r\n货号: 65I-G4F018</br>\r\n风格: 其他</br>\r\n衣长: 常规款</br>\r\n袖长: 长袖</br>\r\n领型: 其他</br>\r\n图案: 其他</br>\r\n品牌: Dolce&Gabbana</br>\r\n适用年龄: 30-34周岁</br>\r\n年份季节: 2017年春季</br>\r\n颜色分类: 白色</br>\r\n尺码: 38 40 42 44</br>\r\n', '0', '7AC81023B9A14D17AE6E717CCB96100C');
INSERT INTO `product` VALUES ('DE595A079D214CB3BA6F4EC5D11DCEEA', 'MaxMara--5131087106002', '2488', '2266', 'products\\DE595A079D214CB3BA6F4EC5D11DCEEA', '2017-06-26', null, '1', '材质成分: 桑蚕丝100%</br>\r\n裤长: 长裤</br>\r\n货号: 5131087106002</br>\r\n女裤裤型: 直筒裤</br>\r\n女裤腰高: 自然腰</br>\r\n颜色分类: 图片色</br>\r\n品牌: MaxMara</br>\r\n尺寸: 36 38 40 42 46 48</br>\r\n厚薄: 常规</br>\r\n年份季节: 2017年春季</br>\r\n', '0', '7AC81023B9A14D17AE6E717CCB96100C');
INSERT INTO `product` VALUES ('DE7404495E86400890A05EC0A9A5CE1C', 'Nike/耐克--NI-12036', '1649', '1400', 'products\\29D2DA4BD7AE4FF5AD90DD52A3292A96.jpg', '2017-06-26', null, '1', '是否商场同款: 是</br>\r\n颜色分类: 002色</br>\r\n现货-香港A仓库</br>\r\n款号: NI-12036</br>\r\n品牌: Nike/耐克</br>\r\n上市时间: 2015年冬季</br>\r\n吊牌价: 999</br>\r\n性别: 女子</br>\r\n鞋帮高度: 高帮帮面</br>\r\n材质: 合成革外底</br>\r\n材料: 耐磨橡胶适合</br>\r\n场地: 室内地板</br>\r\n运动鞋科技: 气垫 </br>\r\n缓震胶功能: 减震 耐磨 包裹性</br>\r\n鞋码: 36.5 37.5 38 38.5 39 40</br>\r\n是否瑕疵: 否</br>\r\n运动系列: JORDAN</br>', '0', 'F7C8C1DC5FD04FA880189BD5F94CBC92');
INSERT INTO `product` VALUES ('EF30213B1BE64CF6881FDB1DDB03667D', 'Tiffany/蒂芙尼--GRP07629', '2713', '1613', 'products\\EF30213B1BE64CF6881FDB1DDB03667D', '2017-06-26', null, '1', '材质: 银饰</br>\r\n 金属材质: 99足银</br>\r\n 颜色分类: 银色</br>\r\n 品牌: Tiffany/蒂芙尼</br>\r\n 价格区间: 1001-3000元</br>\r\n 货号: GRP07629</br>\r\n 价格：2713.00</br>', '0', '1');
INSERT INTO `product` VALUES ('F0F7453510354459962DFB241979EF28', 'Chloe/蔻依', '6434.93', '6134', 'products\\F0F7453510354459962DFB241979EF28', '2017-06-26', null, '1', '品牌: Chloe/蔻依</br>\r\n风格: 休闲</br>\r\n颜色分类: BLACK</br>\r\n尺码: 38</br>\r\n适用场景: 休闲</br>\r\n', '0', 'F7C8C1DC5FD04FA880189BD5F94CBC92');
INSERT INTO `product` VALUES ('F3109952EF3E48C784FBD22386D7A643', ' Kenneth Cole --KL05726SU', '1192', '999', 'products\\8B37D9E6C74C49B3A8A12D74C273A16D.jpg', '2017-06-26', null, '1', '品牌: Kenneth Cole</br>\r\n货号: KL05726SU</br>\r\n上市年份季节: 2017年春季</br>\r\n风格: 通勤帮面材质: 麂皮</br>\r\n内里材质: 头层猪皮</br>\r\n鞋底材质: 橡胶开口深度: 浅口</br>\r\n鞋头款式: 尖头后跟高: 超高跟(大于8cm)</br>\r\n跟底款式: 粗跟</br>\r\n流行元素: 浅口 粗跟</br>\r\n颜色分类: 灰褐色</br>\r\n尺码: 35.5 36 37 37.5 38 39</br>\r\n图案: 纯色</br>\r\n包装体积: 0.03立方米</br>\r\n款式: 单鞋</br>\r\n适用对象: 青年（18-40周岁）</br>\r\n适用场景: 正装鞋头</br>\r\n款式: 尖头</br>\r\n', '0', 'F7C8C1DC5FD04FA880189BD5F94CBC92');
INSERT INTO `product` VALUES ('F4783ED3CF114B7A8252DE6815B04CCF', 'Gucci/古奇--100881', '17060', '15960', 'products\\F4783ED3CF114B7A8252DE6815B04CCF', '2017-06-26', null, '1', '上市时间: 2017年春夏</br>\r\n品牌: Gucci/古奇</br>\r\n货号: 100881 J8540</br>\r\n颜色分类: 图片色</br>\r\n', '0', '1');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` varchar(32) NOT NULL,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `code` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('476D02DAB0DB4CFE8EBFC168AFCCFF20', 'zjx', '123', null, '1137402513@qq.com', '13847381981', null, null, '0', 'bea5f0');
INSERT INTO `user` VALUES ('517F45C3CE7545B5A3050BFB2E3D8AE2', 'admin', 'asd', null, '1684588832@qq.com', '15848644100', null, null, '0', 'fdee56');
INSERT INTO `user` VALUES ('75C2A223568643DD8C6C50DCCE5DB2BD', 'wj', '123', null, '1684588832@qq.com', '1556556665', null, null, '0', '56ede0');
INSERT INTO `user` VALUES ('ACDDDDF8F94C4B3E8E52D2C077DAB695', 'zmr', '123', null, '200994138@qq.com', '12346556', null, null, '0', '75ba5e');
INSERT INTO `user` VALUES ('B097A7F6C2274A5EA837CEF014E32E22', 'sy', '970808', null, '373650423@qq.com', '15848664681', null, null, '0', '5e46ca');
INSERT INTO `user` VALUES ('D5964683E1404E738A3C2C690C4248D6', 'tom', '123', null, '1684588832@qq.com', '15848644100', null, null, '0', '67B6EA');
