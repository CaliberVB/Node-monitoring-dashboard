-- CreateTable
CREATE TABLE "NodeInfo" (
    "nodeId" SERIAL NOT NULL,
    "nodeName" TEXT NOT NULL,
    "blockchain" TEXT NOT NULL,
    "nodeStatus" TEXT NOT NULL,
    "location" TEXT NOT NULL,

    CONSTRAINT "NodeInfo_pkey" PRIMARY KEY ("nodeId")
);

-- CreateTable
CREATE TABLE "CostTracking" (
    "costId" SERIAL NOT NULL,
    "nodeId" INTEGER NOT NULL,
    "occurrence" TEXT NOT NULL,
    "costType" TEXT NOT NULL,
    "amount" DOUBLE PRECISION NOT NULL,
    "date" TIMESTAMP(3) NOT NULL,
    "description" TEXT,

    CONSTRAINT "CostTracking_pkey" PRIMARY KEY ("costId")
);

-- CreateTable
CREATE TABLE "Wallet" (
    "walletId" SERIAL NOT NULL,
    "nodeId" INTEGER NOT NULL,
    "balance" DOUBLE PRECISION NOT NULL,
    "currencyType" TEXT NOT NULL,

    CONSTRAINT "Wallet_pkey" PRIMARY KEY ("walletId")
);

-- CreateTable
CREATE TABLE "Transaction" (
    "txnId" SERIAL NOT NULL,
    "walletId" INTEGER NOT NULL,
    "amount" DOUBLE PRECISION NOT NULL,
    "txnType" TEXT NOT NULL,
    "timestamp" TIMESTAMP(3) NOT NULL,
    "description" TEXT,

    CONSTRAINT "Transaction_pkey" PRIMARY KEY ("txnId")
);

-- CreateTable
CREATE TABLE "AccessLog" (
    "logId" SERIAL NOT NULL,
    "userId" TEXT NOT NULL,
    "action" TEXT NOT NULL,
    "date" TIMESTAMP(3) NOT NULL,
    "nodeId" INTEGER,
    "description" TEXT,

    CONSTRAINT "AccessLog_pkey" PRIMARY KEY ("logId")
);

-- CreateTable
CREATE TABLE "APILog" (
    "apiLogId" SERIAL NOT NULL,
    "apiName" TEXT NOT NULL,
    "nodeId" INTEGER NOT NULL,
    "action" TEXT NOT NULL,
    "date" TIMESTAMP(3) NOT NULL,
    "responseStatus" TEXT NOT NULL,

    CONSTRAINT "APILog_pkey" PRIMARY KEY ("apiLogId")
);

-- CreateTable
CREATE TABLE "Revenue" (
    "revenueId" SERIAL NOT NULL,
    "nodeId" INTEGER NOT NULL,
    "amount" DOUBLE PRECISION NOT NULL,
    "sourceType" TEXT NOT NULL,
    "date" TIMESTAMP(3) NOT NULL,
    "currencyType" TEXT NOT NULL,

    CONSTRAINT "Revenue_pkey" PRIMARY KEY ("revenueId")
);

-- AddForeignKey
ALTER TABLE "CostTracking" ADD CONSTRAINT "CostTracking_nodeId_fkey" FOREIGN KEY ("nodeId") REFERENCES "NodeInfo"("nodeId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Wallet" ADD CONSTRAINT "Wallet_nodeId_fkey" FOREIGN KEY ("nodeId") REFERENCES "NodeInfo"("nodeId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Transaction" ADD CONSTRAINT "Transaction_walletId_fkey" FOREIGN KEY ("walletId") REFERENCES "Wallet"("walletId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AccessLog" ADD CONSTRAINT "AccessLog_nodeId_fkey" FOREIGN KEY ("nodeId") REFERENCES "NodeInfo"("nodeId") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "APILog" ADD CONSTRAINT "APILog_nodeId_fkey" FOREIGN KEY ("nodeId") REFERENCES "NodeInfo"("nodeId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Revenue" ADD CONSTRAINT "Revenue_nodeId_fkey" FOREIGN KEY ("nodeId") REFERENCES "NodeInfo"("nodeId") ON DELETE RESTRICT ON UPDATE CASCADE;
