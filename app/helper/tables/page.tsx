import Breadcrumb from "@/components/Breadcrumbs/Breadcrumb";
import Node from "@/components/Tables/Node";
import Revenue from "@/components/Tables/Revenue";
import Cost from "@/components/Tables/Cost";

import { Metadata } from "next";
export const metadata: Metadata = {
  title: "Tables Page ",
  description: "This is Tables page for Caliber's node monitoring dashboard Next.js",
  // other metadata
};

const TablesPage = () => {
  return (
    <>
      <Breadcrumb pageName="Tables" />

      <div className="flex flex-col gap-10">
        <Node />
        <Cost />
        <Revenue />
      </div>
    </>
  );
};

export default TablesPage;
